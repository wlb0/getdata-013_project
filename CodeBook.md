# Code Book for the project
A description of the variables, the data, and any transformations or work performed to clean up the data

## Data
### Source data
See Data and Summary of Data sections of README.md

### Output data
Tidy data frame with 11880 rows and 5 columns.  
Each row represents a combination of subject, activity name, and feature.  
See variables section below for a description of the 5 columns.

## Transformations
See Data processing steps section of README.md

## Variables
Format:  
*Name (data type)  
Description  
Allowable values*

**Subject** (Integer)  
Identifier for the subject person from whom data was collected.  
Range 1:30
    
**Activity** (Integer)  
Identifier for the type of activity for which data was collected.  
Range 1:6
    
**Activity Name** (Character)  
Description of the activity for which data was collected.  
Relationship between Activity and Activity Name values:
  * 1 Walking
  * 2 Walking Upstairs
  * 3 Walking Downstairs
  * 4 Sitting
  * 5 Standing
  * 6 Laying

**Feature** (Character)  
Description of the measurement that was taken.  
66 possible character string values:
* Mean of time domain signal from body acceleration in the X direction
* Mean of time domain signal from body acceleration in the Y direction
* Mean of time domain signal from body acceleration in the Z direction
* Mean of time domain signal from gravity acceleration in the X direction
* Mean of time domain signal from gravity acceleration in the Y direction
* Mean of time domain signal from gravity acceleration in the Z direction
* Mean of time domain signal from body acceleration jerk in the X direction
* Mean of time domain signal from body acceleration jerk in the Y direction
* Mean of time domain signal from body acceleration jerk in the Z direction
* Mean of time domain signal from body gyroscope in the X direction
* Mean of time domain signal from body gyroscope in the Y direction
* Mean of time domain signal from body gyroscope in the Z direction
* Mean of time domain signal from body gyroscope jerk in the X direction
* Mean of time domain signal from body gyroscope jerk in the Y direction
* Mean of time domain signal from body gyroscope jerk in the Z direction
* Mean of magnitude of time domain signal from body acceleration
* Mean of magnitude of time domain signal from gravity acceleration
* Mean of magnitude of time domain signal from body acceleration jerk
* Mean of magnitude of time domain signal from body gyroscope
* Mean of magnitude of time domain signal from body gyroscope jerk
* Mean of frequency domain signal from body acceleration in the X direction
* Mean of frequency domain signal from body acceleration in the Y direction
* Mean of frequency domain signal from body acceleration in the Z direction
* Mean of frequency domain signal from body acceleration jerk in the X direction
* Mean of frequency domain signal from body acceleration jerk in the Y direction
* Mean of frequency domain signal from body acceleration jerk in the Z direction
* Mean of frequency domain signal from body gyroscope in the X direction
* Mean of frequency domain signal from body gyroscope in the Y direction
* Mean of frequency domain signal from body gyroscope in the Z direction
* Mean of magnitude of frequency domain signal from body acceleration
* Mean of magnitude of frequency domain signal from body acceleration jerk
* Mean of magnitude of frequency domain signal from body gyroscope
* Mean of magnitude of frequency domain signal from body gyroscope jerk
* Standard deviation of time domain signal from body acceleration in the X direction
* Standard deviation of time domain signal from body acceleration in the Y direction
* Standard deviation of time domain signal from body acceleration in the Z direction
* Standard deviation of time domain signal from gravity acceleration in the X direction
* Standard deviation of time domain signal from gravity acceleration in the Y direction
* Standard deviation of time domain signal from gravity acceleration in the Z direction
* Standard deviation of time domain signal from body acceleration jerk in the X direction
* Standard deviation of time domain signal from body acceleration jerk in the Y direction
* Standard deviation of time domain signal from body acceleration jerk in the Z direction
* Standard deviation of time domain signal from body gyroscope in the X direction
* Standard deviation of time domain signal from body gyroscope in the Y direction
* Standard deviation of time domain signal from body gyroscope in the Z direction
* Standard deviation of time domain signal from body gyroscope jerk in the X direction
* Standard deviation of time domain signal from body gyroscope jerk in the Y direction
* Standard deviation of time domain signal from body gyroscope jerk in the Z direction
* Standard deviation of magnitude of time domain signal from body acceleration
* Standard deviation of magnitude of time domain signal from gravity acceleration
* Standard deviation of magnitude of time domain signal from body acceleration jerk
* Standard deviation of magnitude of time domain signal from body gyroscope
* Standard deviation of magnitude of time domain signal from body gyroscope jerk
* Standard deviation of frequency domain signal from body acceleration in the X direction
* Standard deviation of frequency domain signal from body acceleration in the Y direction
* Standard deviation of frequency domain signal from body acceleration in the Z direction
* Standard deviation of frequency domain signal from body acceleration jerk in the X direction
* Standard deviation of frequency domain signal from body acceleration jerk in the Y direction
* Standard deviation of frequency domain signal from body acceleration jerk in the Z direction
* Standard deviation of frequency domain signal from body gyroscope in the X direction
* Standard deviation of frequency domain signal from body gyroscope in the Y direction
* Standard deviation of frequency domain signal from body gyroscope in the Z direction
* Standard deviation of magnitude of frequency domain signal from body acceleration
* Standard deviation of magnitude of frequency domain signal from body acceleration jerk
* Standard deviation of magnitude of frequency domain signal from body gyroscope
* Standard deviation of magnitude of frequency domain signal from body gyroscope jerk

**Signal_mean** (Numeric)  
Average (mean) of the signal measurements taken. The source signal measurements are normalised and bounded within [-1,1].  
Range -1:1
