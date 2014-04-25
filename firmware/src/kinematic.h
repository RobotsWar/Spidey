#ifndef _IK_H
#define _IK_H

// Math util
#define MAX(a,b) (((a)>(b))?(a):(b))
#define MIN(a,b) (((a)<(b))?(a):(b))
#define RAD2DEG(a) ((a)*180.0/M_PI)
#define DEG2RAD(a) ((a)*M_PI/180.0)

bool computeIK(float x, float y, float z,
        float *a, float *b, float *c,
        float l1, float l2, float l3);

#endif
