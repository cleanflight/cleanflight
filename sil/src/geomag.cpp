#include <time.h>
#include <qdatetime.h>
#include "main.h"

extern "C"{
	#include <GeomagnetismHeader.h>
}

namespace{
	MAGtype_MagneticModel*      MagneticModels[1];
	MAGtype_MagneticModel*      TimedMagneticModel;
	MAGtype_Ellipsoid           Ellip;
	MAGtype_Geoid               Geoid;
	MAGtype_Date                date;

	#include "EGM9615.h"
}



void geomag_get( float lat , float lon , float alt , float* mag_x , float* mag_y , float* mag_z ){
	*mag_x = 0;
	*mag_y = 1;
	*mag_z = 0;


	if( MagneticModels[0] == NULL ){
		int epochs = 1;

		MAGtype_MagneticModel** ptr = MagneticModels;

		if( !MAG_robustReadMagModels( "WMM.COF" , &ptr , epochs ) ) {
			return;
		}

		if( MagneticModels[0] == NULL ){
			return;
		}

		int NumTerms = ((MagneticModels[0]->nMax + 1) * (MagneticModels[0]->nMax + 2) / 2);

		TimedMagneticModel = MAG_AllocateModelMemory( NumTerms );

		if( TimedMagneticModel == NULL ){
			return;
		}

		MAG_SetDefaults( &Ellip , &Geoid );

		Geoid.GeoidHeightBuffer = GeoidHeightBuffer;
		Geoid.Geoid_Initialized = 1;


		QDateTime now = QDateTime::currentDateTimeUtc();

		date.Year  = now.date().year();
		date.Month = now.date().month();
		date.Day   = now.date().day();

		char error[256];
		MAG_DateToYear( &date , error ); //should be fine

	}



	MAGtype_CoordGeodetic       geo;
	MAGtype_CoordSpherical      sph;
	MAGtype_GeoMagneticElements mag;

	geo.lambda           = lon;
	geo.phi              = lat; // should we use geocentri or geodetic ?
	geo.HeightAboveGeoid = alt;
	geo.UseGeoid         = TRUE;

	MAG_GeodeticToSpherical( Ellip , geo , &sph );

	MAG_TimelyModifyMagneticModel( date , MagneticModels[0] , TimedMagneticModel );

	MAG_Geomag( Ellip , sph , geo , TimedMagneticModel, &mag ); /* Computes the geoMagnetic field elements and their time change*/

	*mag_x = mag.X;
	*mag_y = mag.Y;
	*mag_z = mag.Z;

}
