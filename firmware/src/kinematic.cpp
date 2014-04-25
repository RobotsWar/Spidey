#include <math.h>
#include <terminal.h>
#include "kinematic.h"

/**
 * Solves the al Kashi problem
 */
float alKashi(float a, float b, float c)
{
    return acos(((a*a)+(b*b)-(c*c))/(2*a*b));
}

/**
 * Compute the kinematics of the robot
 */
bool computeIK(float x, float y, float z,
        float *a, float *b, float *c,
        float l1, float l2, float l3)
{
    float alpha = atan2(y, x);
    float xp = x*cos(alpha)-sin(alpha)*y;

    if (xp < l1) {
        xp = l1;
    }

    float d = sqrt(pow(xp-l1,2) + pow(z,2));
    if (d > l2+l3) {
        d = l2+l3;
    }

    float beta = alKashi(l2, d, l3) - atan2(-z, xp);
    float gamma = M_PI - alKashi(l2, l3, d);
    
    if (!isnan(alpha) && !isnan(beta) && !isnan(gamma)) {
        *a = RAD2DEG(alpha);
        *b = RAD2DEG(beta);
        *c = RAD2DEG(gamma);
        return true;
    } else {
        return false;
    }
}
