

class StepsHelper{

  double getCaloriesFromSteps(int steps){
    return steps * 0.05;
  }

  double getDistanceFromSteps(int steps){
    return steps * 0.067;
  }

  int calculateTodaySteps(int sensorOld, int todayOld, int sensorInput) {
    // if (sensorInput > 0) {
    //   if (sensorOld > sensorInput) {
    //     return sensorInput - sensorOld + todayOld;
    //   } else {
    //     return sensorInput + todayOld;
    //   }
    // } else {
    //   return 0;
    // }
    if (sensorInput >= sensorOld && sensorOld!=0) {
      return sensorInput - sensorOld + todayOld;
    } else if (sensorOld == 0) {
      return todayOld;
    } else {
      return sensorInput + todayOld;
    }
  }

}