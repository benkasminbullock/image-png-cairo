#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "cairo.h"
#include "png.h"

#include "image-png-cairo-perl.c"

MODULE=Image::PNG::Cairo PACKAGE=Image::PNG::Cairo

PROTOTYPES: DISABLE

BOOT:
	/* Image__PNG__Cairo_error_handler = perl_error_handler; */

void fill_png_from_cairo_surface (surface, png, info)
     	SV * surface;
	SV * png;
	SV * info;
PREINIT:
	cairo_surface_t * csurface;
	png_struct * cpng;
	png_info * cinfo;
CODE:
	csurface = INT2PTR (cairo_surface_t *, SvIV ((SV *) SvRV (surface)));
	cpng = INT2PTR (png_struct *, SvIV ((SV *) SvRV (png)));
	cinfo = INT2PTR (png_info *, SvIV ((SV *) SvRV (info)));

	fill_png_from_cairo_surface (csurface, cpng, cinfo);
