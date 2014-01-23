#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "cairo.h"
#include "png.h"

#include "image-png-cairo-perl.c"

MODULE=Image::PNG::Cairo PACKAGE=Image::PNG::Cairo

PROTOTYPES: DISABLE

SV * fill_png_from_cairo_surface (surface, png, info)
     	SV * surface;
	SV * png;
	SV * info;
PREINIT:
	cairo_surface_t * csurface;
	png_struct * cpng;
	png_info * cinfo;
	png_byte ** row_pointers;
CODE:
	csurface = INT2PTR (cairo_surface_t *, SvIV ((SV *) SvRV (surface)));
	cpng = INT2PTR (png_struct *, SvIV ((SV *) SvRV (png)));
	cinfo = INT2PTR (png_info *, SvIV ((SV *) SvRV (info)));

	row_pointers = fill_png_from_cairo_surface (csurface, cpng, cinfo);
	RETVAL = newSV (0);
	sv_setref_pv (RETVAL, "Image::PNG::Libpng::row_pointers", row_pointers);
OUTPUT:
	RETVAL

void free_row_pointers (row_pointers)
	SV * row_pointers
PREINIT:
	png_byte ** crow_pointers;
CODE:
	crow_pointers = INT2PTR (png_byte **, SvIV ((SV *) SvRV (row_pointers)));
	Safefree (crow_pointers);
