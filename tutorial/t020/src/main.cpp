
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <fmt/format.h>
#include <fmt/ostream.h>

#include "MT_Scalar.h"
// #include "MT_ScalarTracer.h"
#include "SOLID.h"


// class DT_Object:
//   list of functions:
//      setMargin()
//      setScaling()
// 		setPosition()
// 		setOrientation()
// 		setMatrix()          getMatrix()
// 		setBBox()            getBBox()
// 		setResponseClass()   getResponseClass()
//      getClientObject()
// 		addProxy()           removeProxy()
//      intersect()          common_point()        penetration_depth()          closest_points()
//   list of variables:
//    	T_ProxyList;
//    	m_client_object;
//    	m_responseClass;
//    	m_shape;
//    	m_margin;
//    	m_xform;
// 	  	m_proxies;
//    	m_bbox;


// describe the function:
// - create a point and a box
// - find the closest pair of points between the point and the box
// - print the distance and the two points
// - destroy the objects and delete the shapes
void simple_box_point()
{
    DT_Vector3 v1 = {1.0, 0.0, 0.0};
    DT_ShapeHandle point_shape = DT_NewPoint( v1 );  // test point - pointer
	DT_ObjectHandle point = DT_CreateObject(0, point_shape);

    DT_ShapeHandle box_shape = DT_NewBox(1.0, 2.0, 3.0);  // box
	DT_ObjectHandle box = DT_CreateObject(0, box_shape);
	// DT_Vector3 scaling = {0.5, 0.5, 0.5};
	// DT_SetScaling(box, scaling);

	DT_Vector3 point1, point2;
	DT_Scalar distance = DT_GetClosestPair(point, box, point1, point2);

	fmt::print("Distance: {} p1:( {}, {}, {} ) p2:( {}, {}, {} )\n", distance,
		point1[0], point1[1], point1[2], point2[0], point2[1], point2[2]);
	// std::cout << "Distance: " << distance << " p1:" << point1 << " p2:" << point2 << std::endl;

	DT_DestroyObject(point);         // first destroy the object
	DT_DeleteShape(point_shape);     // then delete the shape

	DT_DestroyObject(box);
	DT_DeleteShape(box_shape);
}

int main()
{
    fmt::print("Size of DT_Scalar: {}\n", sizeof(DT_Scalar));
	simple_box_point();

    return 0;
}

