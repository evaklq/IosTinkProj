/* This file was generated by upb_generator from the input file:
 *
 *     udpa/annotations/security.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef UDPA_ANNOTATIONS_SECURITY_PROTO_UPBDEFS_H_
#define UDPA_ANNOTATIONS_SECURITY_PROTO_UPBDEFS_H_

#include "upb/reflection/def.h"
#include "upb/reflection/internal/def_pool.h"
#include "upb/port/def.inc"
#ifdef __cplusplus
extern "C" {
#endif

#include "upb/reflection/def.h"

#include "upb/port/def.inc"

extern _upb_DefPool_Init udpa_annotations_security_proto_upbdefinit;

UPB_INLINE const upb_MessageDef *udpa_annotations_FieldSecurityAnnotation_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &udpa_annotations_security_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "udpa.annotations.FieldSecurityAnnotation");
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* UDPA_ANNOTATIONS_SECURITY_PROTO_UPBDEFS_H_ */
