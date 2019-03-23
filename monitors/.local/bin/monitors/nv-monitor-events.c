#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

#include <X11/Xlib.h>

#include "NVCtrl.h"
#include "NVCtrlLib.h"

static void print_usage(char **argv)
{
    fprintf(stderr, "Usage:\n");
    fprintf(stderr, "%s [-d <dpy>]\n", argv[0]);
    fprintf(stderr, "\n");
    fprintf(stderr, "-d <dpy>: X server display to connect to\n");
}

int main(int argc, char **argv)
{
	Bool ret;
	int event_base, error_base;

	char c;
	char* dpy_name = NULL;
	while ((c = getopt(argc, argv, "d:acbsh")) >= 0) {
        switch (c) {
        case 'd':
            dpy_name = optarg;
            break;
        case '?':
            fprintf(stderr, "%s: Unknown argument '%c'\n", argv[0], optopt);
            /* fallthrough */
        case 'h':
            print_usage(argv);
            return 1;
        }
	}

	/*
     * Open a display connection, and make sure the NV-CONTROL X
     * extension is present on the screen we want to use.
     */

    Display* dpy = XOpenDisplay(dpy_name);
    if (!dpy) {
        fprintf(stderr, "Cannot open display '%s'.\n", XDisplayName(dpy_name));
        return 1;
    }
    
    /*
     * check if the NV-CONTROL X extension is present on this X server
     */    
    ret = XNVCTRLQueryExtension(dpy, &event_base, &error_base);
    if (ret != True) {
        fprintf(stderr, "The NV-CONTROL X extension does not exist on '%s'.\n",
                XDisplayName(dpy_name));
        return 1;
    }

    /* Query target counts */
    int count;
    ret = XNVCTRLQueryTargetCount(dpy, NV_CTRL_TARGET_TYPE_X_SCREEN, &count);
    if (ret != True) {
        fprintf(stderr, "Failed to query %s target count on '%s'.\n",
                NV_CTRL_TARGET_TYPE_X_SCREEN, XDisplayName(dpy_name));
        return 1;
    }

    for (int i = 0; i < count; i++) {
	    ret = XNVCtrlSelectTargetNotify(dpy,
	    		NV_CTRL_TARGET_TYPE_X_SCREEN, i,
	    		TARGET_ATTRIBUTE_CHANGED_EVENT, True);
	    if (ret != True) {
	        fprintf(stderr, "- Unable to register on NV_CTRL_TARGET_TYPE_X_SCREEN %d for TARGET_ATTRIBUTE_CHANGED_EVENT.\n", i);
	        return 1;
	    }
	}

    fprintf(stderr, "Listening on NV_CTRL_TARGET_TYPE_X_SCREEN for TARGET_ATTRIBUTE_CHANGED_EVENT events...\n");

    setvbuf(stdout, NULL, _IOLBF, 0);
    while (True) {
        XEvent event;
        const char *target_str;

        XNextEvent(dpy, &event);

        if (event.type == (event_base + TARGET_ATTRIBUTE_CHANGED_EVENT)) {
        	XNVCtrlAttributeChangedEventTarget *nveventtarget =
                (XNVCtrlAttributeChangedEventTarget *) &event;
            if (nveventtarget->attribute == 234) {
            	printf("Monitors change: 0x%08x \n", nveventtarget->value);
            }
        }
        else {
            fprintf(stderr, "ERROR: unrecognized event type %d\n", event.type);
        }
    }
}