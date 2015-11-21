/* World Magnetic Model (WMM) File processing program. The program can accept
the input parameters from a user specified file. Then WMM program is called
to compute the magnetic fields. The results are then printed to the specified
output file.

The Geomagnetism Library is used in this program. The program expects the files
WMM.COF and EGM9615.h to be in the same directory.

The program uses the user interface developed for geomag61.c
Note the option for geocentric height (C) is not supported in this version
The height entered is considered as height above mean sea level

Manoj.C.Nair@Noaa.Gov
November 15, 2009

 *  Revision Number: $Revision: 1287 $
 *  Last changed by: $Author: awoods $
 *  Last changed on: $Date: 2014-12-09 15:55:09 -0700 (Tue, 09 Dec 2014) $



 */
/****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* The following include file must define a function 'MAG_isNaN' */
/* This function, which returns '1' if the number is NaN and 0*/
/* otherwise, could be hand-written if not available. */
/* Comment out one of the two following lines, as applicable */
#include <math.h>               /* for gcc */

#include "GeomagnetismHeader.h"
#include "EGM9615.h"
/*#include "GeomagnetismLibrary.c"*/


#define NaN log(-1.0)
/* constants */
#define RECL 81

#define MAXINBUFF RECL+14

/** Max size of in buffer **/

#define MAXREAD MAXINBUFF-2
/** Max to read 2 less than total size (just to be safe) **/


#define PATH MAXREAD




/****************************************************************************/
/*                                                                          */
/*      Some variables used in this program                                 */
/*                                                                          */
/*    Name         Type                    Usage                            */
/* ------------------------------------------------------------------------ */

/*                                                                          */
/*   minalt     double array of MAXMOD  Minimum height of model.             */
/*                                                                          */
/*   altmin     double                  Minimum height of selected model.    */
/*                                                                          */
/*   altmax     double array of MAXMOD  Maximum height of model.             */
/*                                                                          */
/*   maxalt     double                  Maximum height of selected model.    */
/*                                                                          */
/*   sdate  Scalar double           start date inputted                      */
/*                                                                          */
/*   alt        Scalar double           altitude above WGS84 Ellipsoid       */
/*                                                                          */
/*   latitude   Scalar double           Latitude.                            */
/*                                                                          */
/*   longitude  Scalar double           Longitude.                           */
/*                                                                          */
/*   inbuff     Char a of MAXINBUF     Input buffer.                        */
/*                                                                          */
/*                                                                          */
/*   minyr      double                  Min year of all models               */
/*                                                                          */
/*   maxyr      double                  Max year of all models               */
/*                                                                          */
/*   yrmax      double array of MAXMOD  Max year of model.                   */
/*                                                                          */
/*   yrmin      double array of MAXMOD  Min year of model.                   */
/*                                                                          */

/****************************************************************************/


int main(int argv, char**argc)
{
#ifdef MAC
    ccommand(argv, argc);
#endif
    /*  WMM Variable declaration  */

    MAGtype_MagneticModel *TimedMagneticModel, *MagneticModels[1];
    MAGtype_Ellipsoid Ellip;
    MAGtype_CoordSpherical CoordSpherical;
    MAGtype_CoordGeodetic CoordGeodetic;
    MAGtype_Date UserDate;
    MAGtype_GeoMagneticElements GeoMagneticElements, Errors;
    MAGtype_Geoid Geoid;
    char ans[20];
    char filename[] = "WMM.COF";
    int NumTerms, epochs = 1, epoch = 0, i, nMax = 0, printErrors = 0;
    char VersionDate_Large[] = "$Date: 2014-12-09 15:55:09 -0700 (Tue, 09 Dec 2014) $";
    char VersionDate[12];

    /* Control variables */
    int again = 1;
    int decyears = 3;
    int units = 4;
    int decdeg = 3;
    int range = -1;
    int igdgc = 3;
    int isyear = -1;
    int ismonth = -1;
    int isday = -1;
    int ieyear = -1;
    int iemonth = -1;
    int ieday = -1;
    int ilat_deg = 200;
    int ilat_min = 200;
    int ilat_sec = 200;
    int ilon_deg = 200;
    int ilon_min = 200;
    int ilon_sec = 200;


    int coords_from_file = 0;
    int arg_err = 0;

    char inbuff[MAXINBUFF];

    char *begin;
    char *rest;
    char args[7][MAXREAD];
    int iarg;

    char coord_fname[PATH];
    char out_fname[PATH];
    FILE *coordfile = NULL, *outfile = NULL;
    int iline = 0;
    int read_flag;

    double minyr;
    double maxyr;
    double minalt;
    double maxalt;
    double alt = -999999;
    double sdate = -1;
    double step = -1;
    double edate = -1;
    double latitude = 200;
    double longitude = 200;



    /*  Subroutines used  */

    void print_result_file(FILE *outf, double d, double i, double h, double x, double y, double z, double f,
            double ddot, double idot, double hdot, double xdot, double ydot, double zdot, double fdot);
    void append_errors_to_result_file(FILE *outf, MAGtype_GeoMagneticElements Errors);
    double degrees_to_decimal();
    double julday();
    int getshc();


    /* Initializations. */

    inbuff[MAXREAD + 1] = '\0'; /* Just to protect mem. */
    inbuff[MAXINBUFF - 1] = '\0'; /* Just to protect mem. */


    /* Memory allocation */

    strncpy(VersionDate, VersionDate_Large + 39, 11);
    VersionDate[11] = '\0';
    if(!MAG_robustReadMagModels(filename, &MagneticModels, epochs)) {
            printf("\n WMM.COF not found.  Press enter to exit... \n ");
        fgets(ans, 20, stdin);
        return 1;
    }
    for(i = 0; i < epochs; i++) if(MagneticModels[i]->nMax > nMax) nMax = MagneticModels[i]->nMax;
    NumTerms = ((nMax + 1) * (nMax + 2) / 2);

    TimedMagneticModel = MAG_AllocateModelMemory(NumTerms); /* For storing the time modified WMM Model parameters */

    for(i = 0; i < epochs; i++) if(MagneticModels[i] == NULL || TimedMagneticModel == NULL)
        {
            MAG_Error(2);
        }

    MAG_SetDefaults(&Ellip, &Geoid); /* Set default values and constants */
    /* Check for Geographic Poles */

    /* Set EGM96 Geoid parameters */
    Geoid.GeoidHeightBuffer = GeoidHeightBuffer;
    Geoid.Geoid_Initialized = 1;
    /* Set EGM96 Geoid parameters END */
    maxyr = MagneticModels[0]->CoefficientFileEndDate;
    minyr = MagneticModels[0]->epoch;

    for(iarg = 0; iarg < argv; iarg++)
        if(argc[iarg] != NULL)
            strncpy(args[iarg], argc[iarg], MAXREAD);

    printf("\n\n-----------------------------------------------\n");
    printf(" WMM File processing program %s", VersionDate);
    printf("\n-----------------------------------------------\n");

    if(argv == 1 || ((argv == 2) && (*(args[1]) == 'h')))
    {
        printf("\nWelcome to the World Magnetic Model (WMM) C-Program\nof the US National Geophysical Data Center\n               --- File Processing Program ----\n             --- Model Release Date: 15 Dec %d ---\n           --- Software Release Date: %s ---\nUSAGE:\n", (int)MagneticModels[0]->epoch - 1, VersionDate);
        printf("For example: MAG_file f input_file output_file\n");
        printf("This screen:     MAG_file h \n");
        printf("\n");
        printf("The input file may have any number of entries but they must follow\n");
        printf("the following format\n");
        printf("Date and location Formats: \n");
        printf("   Date: xxxx.xxx for decimal  (%.1f)\n", MagneticModels[0]->epoch+3.7);
        printf("   Altitude: M - Above mean sea level: E above WGS84 Ellipsoid \n");
        printf("   Altitude: Kxxxxxx.xxx for kilometers  (K1000.13)\n");
        printf("             Mxxxxxx.xxx for meters  (m1389.24)\n");
        printf("             Fxxxxxx.xxx for feet  (F192133.73)\n");
        printf("   Lat/Lon: xxx.xxx in decimal  (-76.53)\n");
        printf("            (Lat and Lon must be specified in the same format.)\n");
        printf("   Date and altitude must fit model.\n");
        printf("   Lat: -90 to 90 (Use - to denote Southern latitude.)\n");
        printf("   Lon: -180 to 180 (Use - to denote Western longitude.)\n");
        printf("   Date: %.1f to %.1f\n", MagneticModels[0]->epoch, MagneticModels[0]->epoch+5);
        printf("   An example of an entry in input file\n");
        printf("   %.1f E F30000 -70.3 -30.8 \n", MagneticModels[0]->epoch+3.7);
        printf("\n Press enter to exit.");
        printf("\n >");
        fgets(ans, 20, stdin);

        for(i = 0; i < epochs; i++) MAG_FreeMagneticModelMemory(MagneticModels[i]);
        MAG_FreeMagneticModelMemory(TimedMagneticModel);

        exit(2);
    } /* help */

    if((argv == 4) && (*(args[1]) == 'f'))
    {
        printf("\n\n 'f' switch: converting file with multiple locations.\n");
        printf("     The first five output columns repeat the input coordinates.\n");
        printf("     Then follows D, I, H, X, Y, Z, and F.\n");
        printf("     Finally the SV: dD, dI, dH, dX, dY, dZ,  and dF\n");

        coords_from_file = 1;
        strncpy(coord_fname, args[2], MAXREAD);
        coordfile = fopen(coord_fname, "rt");
        strncpy(out_fname, args[3], MAXREAD);
        outfile = fopen(out_fname, "w");
        fprintf(outfile, "Date Coord-System Altitude Latitude Longitude D_deg D_min I_deg I_min H_nT X_nT Y_nT Z_nT F_nT dD_min dI_min dH_nT dX_nT dY_nT dZ_nT dF_nT\n");
    } /* file option */

    if(argv >= 2 && argv != 4 && argv != 5)
    {
        printf("\n\nERROR in 'f' switch option: wrong number of arguments\n");
        exit(2);
    }

    if(argv == 1)
    {
        printf("\n\nERROR in switch option: wrong number of arguments\n");
        exit(2);
    }

        if(argv == 5)
    {
        for (i = 0; i<=2; i++){
            if((*(args[i]) == 'e') || strcmp(args[i], "--Errors") == 0 || strcmp(args[i],"--errors") == 0) 
            {
                printErrors = 1;
                break;
            }
        }
        if(printErrors==0){
            printf("\n\nERROR in 'f' switch option: wrong number of arguments2\n");
            exit(2);
        }
        if((*(args[1]) == 'f') || (*(args[2]) == 'f'))
        {
                printf("\n\n 'f' switch: converting file with multiple locations.\n");
                printf("     The first five output columns repeat the input coordinates.\n");
                printf("     Then follows D, I, H, X, Y, Z, and F.\n");
                printf("     Finally the SV: dD, dI, dH, dX, dY, dZ,  and dF\n");

                coords_from_file = 1;
                strncpy(coord_fname, args[3], MAXREAD);
                coordfile = fopen(coord_fname, "rt");
                strncpy(out_fname, args[4], MAXREAD);
                outfile = fopen(out_fname, "w");
                fprintf(outfile, "Date MSL-Ellipsoid Depth(m) Latitude Longitude D_deg D_min I_deg I_min H_nT X_nT Y_nT Z_nT F_nT dD_min dI_min dH_nT dX_nT dY_nT dZ_nT dF_nT");
                if (printErrors==1) {
                    fprintf(outfile, " \u03B4D_min \u03B4I_min \u03B4H_nT \u03B4X_nt \u03B4Y_nT \u03B4Z_nT \u03B4F_nT");
                }
                fprintf(outfile,"\n");
        } /* file option */
    }


    while(again == 1)
    {
        if(coords_from_file)
        {
            argv = 6;
            read_flag = fscanf(coordfile, "%s%s%s%s%s%*[^\n]", args[1], args[2], args[3], args[4], args[5]);
            if(read_flag == EOF) goto reached_EOF;
            fprintf(outfile, "%s %s %s %s %s ", args[1], args[2], args[3], args[4], args[5]);
            fflush(outfile);
            iline++;
        } /* coords_from_file */

        /* Switch on how many arguments are supplied. */
        /* Note that there are no 'breaks' after the cases, so these are entry points */
        switch(argv) {
            case 6: strncpy(inbuff, args[5], MAXREAD);
                if((rest = strchr(inbuff, ','))) /* If it contains a comma */
                {
                    decdeg = 2; /* Then not decimal degrees */
                    begin = inbuff;
                    rest[0] = '\0'; /* Chop into sub string */
                    rest++; /* Move to next substring */
                    ilon_deg = atoi(begin);
                    begin = rest;
                    if((rest = strchr(begin, ',')))
                    {
                        rest[0] = '\0';
                        rest++;
                        ilon_min = atoi(begin);
                        ilon_sec = atoi(rest);
                    } else
                    {
                        ilon_min = 0;
                        ilon_sec = 0;
                    }
                } else
                {
                    decdeg = 1; /* Else it's decimal */
                    longitude = atof(args[5]);
                }

            case 5: strncpy(inbuff, args[4], MAXREAD);
                if((rest = strchr(inbuff, ',')))
                {
                    decdeg = 2;
                    begin = inbuff;
                    rest[0] = '\0';
                    rest++;
                    ilat_deg = atoi(begin);
                    begin = rest;
                    if((rest = strchr(begin, ',')))
                    {
                        rest[0] = '\0';
                        rest++;
                        ilat_min = atoi(begin);
                        ilat_sec = atoi(rest);
                    } else
                    {
                        ilat_min = 0;
                        ilat_sec = 0;
                    }
                } else
                {
                    decdeg = 1;
                    latitude = atof(args[4]);
                }

            case 4: strncpy(inbuff, args[3], MAXREAD);
                inbuff[0] = toupper(inbuff[0]);
                if(inbuff[0] == 'K') units = 1;
                else if(inbuff[0] == 'M') units = 2;
                else if(inbuff[0] == 'F') units = 3;
                if(strlen(inbuff) > 1)
                {
                    inbuff[0] = '\0';
                    begin = inbuff + 1;
                    alt = atof(begin);
                }

            case 3: strncpy(inbuff, args[2], MAXREAD);
                inbuff[0] = toupper(inbuff[0]);
                if(inbuff[0] == 'M') igdgc = 1; /* height is above  mean sea level*/
                else if(inbuff[0] == 'E') igdgc = 2; /* height is above  WGS 84 ellepsoid */


            case 2: strncpy(inbuff, args[1], MAXREAD);
                if((rest = strchr(inbuff, '-'))) /* If it contains a dash */
                {
                    range = 2; /* They want a range */
                    rest[0] = '\0'; /* Sep dates */
                    rest++;
                    begin = rest;
                    if((rest = strchr(begin, '-'))) /* If it contains 2 dashs */
                    {
                        rest[0] = '\0'; /* Sep step */
                        rest++;
                        step = atof(rest); /* Get step size */
                    }
                    if((rest = strchr(begin, ','))) /* If it contains a comma */
                    {
                        decyears = 2; /* It's not decimal years */
                        rest[0] = '\0';
                        rest++;
                        ieyear = atoi(begin);
                        begin = rest;
                        if((rest = strchr(begin, ',')))
                        {
                            rest[0] = '\0';
                            rest++;
                            iemonth = atoi(begin);
                            ieday = atoi(rest);
                        } else
                        {
                            iemonth = 0;
                            ieday = 0;
                        }
                        if((rest = strchr(inbuff, ',')))
                        {
                            begin = inbuff;
                            rest[0] = '\0';
                            rest++;
                            isyear = atoi(begin);
                            begin = rest;
                            if((rest = strchr(begin, ',')))
                            {
                                rest[0] = '\0';
                                rest++;
                                ismonth = atoi(begin);
                                isday = atoi(rest);
                            } else
                            {
                                ismonth = 0;
                                isday = 0;
                            }
                        } else
                        {
                            sdate = atof(inbuff);
                        }
                    } else
                    {
                        decyears = 1; /* Else it's decimal years */
                        sdate = atof(inbuff);
                        edate = atof(begin);
                    }
                } else
                {
                    range = 1;
                    if((rest = strchr(inbuff, ','))) /* If it contains a comma */
                    {
                        decyears = 2; /* It's not decimal years */
                        begin = inbuff;
                        rest[0] = '\0';
                        rest++;
                        isyear = atoi(begin);
                        begin = rest;
                        if((rest = strchr(begin, ',')))
                        {
                            rest[0] = '\0';
                            rest++;
                            ismonth = atoi(begin);
                            isday = atoi(rest);
                        } else
                        {
                            ismonth = 0;
                            isday = 0;
                        }
                    } else
                    {
                        decyears = 1; /* Else it's decimal years */
                        sdate = atof(args[1]);
                    }
                }
                if(sdate == 0)
                { /* If date not valid */
                    decyears = -1;
                    range = -1;
                }
                break;

        }

        if(range == 2 && coords_from_file)
        {
            printf("Error in line %1d, date = %s: date ranges not allowed for file option\n\n", iline, args[1]);
            exit(2);
        }

        /*  Obtain the desired model file and read the data  */

        /* if date specified in command line then warn if past end of validity */

        /*  Take in field data  */

        /* Get date */

        if(coords_from_file && !arg_err && (decyears != 1 && decyears != 2))
        {
            printf("\nError: unrecognized date %s in coordinate file line %1d\n\n", args[1], iline);
            arg_err = 1;
        }

        if(coords_from_file && !arg_err && range != 1)
        {
            printf("\nError: unrecognized date %s in coordinate file line %1d\n\n", args[1], iline);
            arg_err = 1;
        }

        if(coords_from_file && !arg_err && (sdate < minyr || sdate > maxyr))
        {
            printf("\nWarning:  date out of range in coordinate file line %1d\n\n", iline);
            printf("\nExpected range = %6.1f - %6.1f, entered %6.1f\n", minyr, maxyr, sdate);
        }


        /* Get altitude min and max for selected model. */
        minalt = -10; /* To be defined */
        maxalt = 1000;

        /* Get Coordinate prefs */

        if(coords_from_file && !arg_err && (igdgc != 1 && igdgc != 2))
        {
            printf("\nError: Unrecognized height reference %s in coordinate file line %1d\n\n", args[1], iline);
            arg_err = 1;
        }

        /* If needed modify height referencing */
        if(igdgc == 2)
        {
            Geoid.UseGeoid = 0; /* height above WGS-84 Ellipsoid */
        } else if(igdgc == 1)
        {
            Geoid.UseGeoid = 1; /* height above MSL */
        }


        /* Do unit conversions if neccessary */
        if(units == 2)
        {
            minalt *= 1000.0;
            maxalt *= 1000.0;
        } else if(units == 3)
        {
            minalt *= 3280.0839895;
            maxalt *= 3280.0839895;
        }

        /* Get altitude */

        if(coords_from_file && !arg_err && (alt < minalt || alt > maxalt))
        {
            printf("\nError: unrecognized altitude %s in coordinate file line %1d\n\n", args[3], iline);
            arg_err = 1;
        }

        /* Convert altitude to km */
        if(units == 2)
        {
            alt *= 0.001;
        } else if(units == 3)
        {
            alt /= 3280.0839895;
        }



        /* Get lat/long prefs */

        if(coords_from_file && !arg_err && decdeg != 1)
        {
            printf("\nError: unrecognized lat %s or lon %s in coordinate file line %1d\n\n", args[4], args[5], iline);
            arg_err = 1;
        }



        /* Get lat/lon */


        /** This will compute everything needed for 1 point in time. **/

        CoordGeodetic.lambda = longitude;
        CoordGeodetic.phi = latitude;
        CoordGeodetic.HeightAboveGeoid = alt;
        UserDate.DecimalYear = sdate;


        MAG_ConvertGeoidToEllipsoidHeight(&CoordGeodetic, &Geoid); /*This converts the height above mean sea level to height above the WGS-84 ellipsoid*/
        MAG_GeodeticToSpherical(Ellip, CoordGeodetic, &CoordSpherical); /*Convert from geodeitic to Spherical Equations: 17-18, WMM Technical report*/
        epoch = ((int) UserDate.DecimalYear - 1900) / 5;
        if(epoch >= epochs)
            epoch = epochs - 1;
        if(epoch < 0)
            epoch = 0;
        MAG_TimelyModifyMagneticModel(UserDate, MagneticModels[epoch], TimedMagneticModel); /* Time adjust the coefficients, Equation 19, WMM Technical report */
        MAG_Geomag(Ellip, CoordSpherical, CoordGeodetic, TimedMagneticModel, &GeoMagneticElements); /* Computes the geoMagnetic field elements and their time change*/
        MAG_CalculateGridVariation(CoordGeodetic, &GeoMagneticElements);



        /** Above will compute everything for 1 point in time.  **/


        /*  Output the final results. */


        if(coords_from_file)
        {
            print_result_file(outfile,
                    GeoMagneticElements.Decl,
                    GeoMagneticElements.Incl,
                    GeoMagneticElements.H,
                    GeoMagneticElements.X,
                    GeoMagneticElements.Y,
                    GeoMagneticElements.Z,
                    GeoMagneticElements.F,
                    60 * GeoMagneticElements.Decldot,
                    60 * GeoMagneticElements.Incldot,
                    GeoMagneticElements.Hdot,
                    GeoMagneticElements.Xdot,
                    GeoMagneticElements.Ydot,
                    GeoMagneticElements.Zdot,
                    GeoMagneticElements.Fdot);
           if(printErrors){
                MAG_WMMErrorCalc(GeoMagneticElements.H, &Errors);
                append_errors_to_result_file(outfile,
                        Errors);
            }
            fprintf(outfile, "\n");
        }

        if(coords_from_file)
            again = !feof(coordfile) && !arg_err;

        if(again == 1)
        {
            /* Reset defaults to catch on all while loops */
            igdgc = decyears = units = decdeg = -1;
            ismonth = isday = isyear = sdate = edate = range = step = -1;
            latitude = ilat_deg = ilat_min = ilat_sec = 200;
            longitude = ilon_deg = ilon_min = ilon_sec = 200;
            alt = -9999999;
            argv = 1;
        }
    } /* while (again == 1) */

reached_EOF:

    if(coords_from_file) printf("\n Processed %1d lines\n\n", iline);

    if(coords_from_file && !feof(coordfile) && arg_err) printf("Terminated prematurely due to argument error in coordinate file\n\n");


    fclose(coordfile);
    fclose(outfile);

    for(i = 0; i < epochs; i++) MAG_FreeMagneticModelMemory(MagneticModels[i]);
    MAG_FreeMagneticModelMemory(TimedMagneticModel);



    return 0;
}

void print_result_file(FILE *outf, double d, double i, double h, double x, double y, double z, double f,
        double ddot, double idot, double hdot, double xdot, double ydot, double zdot, double fdot)
{
    int ddeg, ideg;
    double dmin, imin;
    /* Change d and i to deg and min */


    ddeg = (int) d;
    dmin = (d - (double) ddeg)*60;
    if(ddeg != 0) dmin = fabs(dmin);
    ideg = (int) i;
    imin = (i - (double) ideg)*60;
    if(ideg != 0) imin = fabs(imin);

    if(MAG_isNaN(d))
    {
        if(MAG_isNaN(x))
            fprintf(outf, " NaN        %4dd %2.0fm  %8.1f      NaN      NaN %8.1f %8.1f", ideg, imin, h, z, f);
        else
            fprintf(outf, " NaN        %4dd %2.0fm  %8.1f %8.1f %8.1f %8.1f %8.1f", ideg, imin, h, x, y, z, f);
    } else
        fprintf(outf, " %4dd %2.0fm  %4dd %2.0fm  %8.1f %8.1f %8.1f %8.1f %8.1f", ddeg, dmin, ideg, imin, h, x, y, z, f);

    if(MAG_isNaN(ddot))
    {
        if(MAG_isNaN(xdot))
            fprintf(outf, "      NaN  %7.1f     %8.1f      NaN      NaN %8.1f %8.1f", idot, hdot, zdot, fdot);
        else
            fprintf(outf, "      NaN  %7.1f     %8.1f %8.1f %8.1f %8.1f %8.1f", idot, hdot, xdot, ydot, zdot, fdot);
    } else
        fprintf(outf, " %7.1f   %7.1f     %8.1f %8.1f %8.1f %8.1f %8.1f", ddot, idot, hdot, xdot, ydot, zdot, fdot);

    return;
} /* print_result_file */

void append_errors_to_result_file(FILE *outf, MAGtype_GeoMagneticElements Errors)
{
    if(MAG_isNaN(Errors.Decl))
    {
        if(MAG_isNaN(Errors.X))
            fprintf(outf, " NaN         %3.0f  %8.1f      NaN      NaN %8.1f %8.1f", 60*Errors.Incl, Errors.H, Errors.Z, Errors.F);
        else
            fprintf(outf, " NaN         %3.0f  %8.1f %8.1f %8.1f %8.1f %8.1f", 60*Errors.Incl, Errors.H, Errors.X, Errors.Y, Errors.Z, Errors.F);
    } else
        fprintf(outf, " %3.0f  %3.0f  %8.1f %8.1f %8.1f %8.1f %8.1f", 60*Errors.Decl, 60*Errors.Incl, Errors.H, Errors.X, Errors.Y, Errors.Z, Errors.F);

    return;
} /* append_errors_to_result_file */


/****************************************************************************/
/*                                                                          */
/*                       Subroutine degrees_to_decimal                      */
/*                                                                          */
/****************************************************************************/
/*                                                                          */
/*     Converts degrees,minutes, seconds to decimal degrees.                */
/*                                                                          */
/*     Input:                                                               */
/*            degrees - Integer degrees                                     */
/*            minutes - Integer minutes                                     */
/*            seconds - Integer seconds                                     */
/*                                                                          */
/*     Output:                                                              */
/*            decimal - degrees in decimal degrees                          */
/*                                                                          */
/*     C                                                                    */
/*           C. H. Shaffer                                                  */
/*           Lockheed Missiles and Space Company, Sunnyvale CA              */
/*           August 12, 1988                                                */
/*                                                                          */

/****************************************************************************/

double degrees_to_decimal(int degrees, int minutes, int seconds)
{
    double deg;
    double min;
    double sec;
    double decimal;

    deg = degrees;
    min = minutes / 60.0;
    sec = seconds / 3600.0;

    decimal = fabs(sec) + fabs(min) + fabs(deg);

    if(deg < 0)
    {
        decimal = -decimal;
    } else if(deg == 0)
    {
        if(min < 0)
        {
            decimal = -decimal;
        } else if(min == 0)
        {
            if(sec < 0)
            {
                decimal = -decimal;
            }
        }
    }

    return (decimal);
}

/****************************************************************************/
/*                                                                          */
/*                           Subroutine julday                              */
/*                                                                          */
/****************************************************************************/
/*                                                                          */
/*     Computes the decimal day of year from month, day, year.              */
/*     Leap years accounted for 1900 and 2000 are not leap years.           */
/*                                                                          */
/*     Input:                                                               */
/*           year - Integer year of interest                                */
/*           month - Integer month of interest                              */
/*           day - Integer day of interest                                  */
/*                                                                          */
/*     Output:                                                              */
/*           date - Julian date to thousandth of year                       */
/*                                                                          */
/*     FORTRAN                                                              */
/*           S. McLean                                                      */
/*           NGDC, NOAA egc1, 325 Broadway, Boulder CO.  80301              */
/*                                                                          */
/*     C                                                                    */
/*           C. H. Shaffer                                                  */
/*           Lockheed Missiles and Space Company, Sunnyvale CA              */
/*           August 12, 1988                                                */
/*                                                                          */
/*     Julday Bug Fix                                                       */
/*           Thanks to Rob Raper                                            */

/****************************************************************************/


double julday(i_month, i_day, i_year)
int i_month;
int i_day;
int i_year;
{
    int aggregate_first_day_of_month[13];
    int leap_year = 0;
    int truncated_dividend;
    double year;
    double day;
    double decimal_date;
    double remainder = 0.0;
    double divisor = 4.0;
    double dividend;
    double left_over;

    aggregate_first_day_of_month[1] = 1;
    aggregate_first_day_of_month[2] = 32;
    aggregate_first_day_of_month[3] = 60;
    aggregate_first_day_of_month[4] = 91;
    aggregate_first_day_of_month[5] = 121;
    aggregate_first_day_of_month[6] = 152;
    aggregate_first_day_of_month[7] = 182;
    aggregate_first_day_of_month[8] = 213;
    aggregate_first_day_of_month[9] = 244;
    aggregate_first_day_of_month[10] = 274;
    aggregate_first_day_of_month[11] = 305;
    aggregate_first_day_of_month[12] = 335;

    /* Test for leap year.  If true add one to day. */

    year = i_year; /*    Century Years not   */
    if((i_year != 1900) && (i_year != 2100)) /*  divisible by 400 are  */
    { /*      NOT leap years    */
        dividend = year / divisor;
        truncated_dividend = dividend;
        left_over = dividend - truncated_dividend;
        remainder = left_over*divisor;
        if((remainder > 0.0) && (i_month > 2))
        {
            leap_year = 1;
        } else
        {
            leap_year = 0;
        }
    }
    day = aggregate_first_day_of_month[i_month] + i_day - 1 + leap_year;
    if(leap_year)
    {
        decimal_date = year + (day / 366.0); /*In version 3.0 this was incorrect*/
    } else
    {
        decimal_date = year + (day / 365.0); /*In version 3.0 this was incorrect*/
    }
    return (decimal_date);
}

