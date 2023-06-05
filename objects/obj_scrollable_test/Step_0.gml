if( flickVelY != 0 ){
 flick_power = abs(flickVelY);
 flick_direction = sign(flickVelY);
 if( flick_power > flick_power_reduction_each_step ) {
  y += (( flick_power / flick_power_calibration) * flick_direction);
  flickVelY -= flick_power_reduction_each_step * flick_direction;
 } else {
  flickVelY = 0;
 }
}