#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include "image-png-cairo-perl.c"

typedef image_png_cairo_t * Image__PNG__Cairo;

MODULE=Image::PNG::Cairo PACKAGE=Image::PNG::Cairo

PROTOTYPES: DISABLE

BOOT:
	/* Image__PNG__Cairo_error_handler = perl_error_handler; */

