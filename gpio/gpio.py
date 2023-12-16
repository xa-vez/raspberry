
#import the GPIO and time package
import RPi.GPIO as GPIO
import time

ON=1
OFF=0

GPIO.setmode(GPIO.BCM)
GPIO.setup(2, GPIO.OUT)
# loop through 50 times, on/off for 1 second
for i in range(5000):
    
    print("on")
    GPIO.output(2,OFF)
    time.sleep(.1)
    print("off")
    GPIO.output(2,ON)
    time.sleep(.1)

    print("wait")
    time.sleep(5)

GPIO.cleanup()
