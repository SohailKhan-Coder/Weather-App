import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityView extends StatelessWidget {
  const CityView({super.key});

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      //   title: Text("CITY VIEW",style: TextStyle(color: Colors.white),),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cv1.jpg'),fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

         //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text("CITY"),
                  labelStyle: GoogleFonts.abrilFatface(color: Colors.white),
                  hintText: "Enter City Name",
                  hintStyle: GoogleFonts.aboreto(color: Colors.white),
                  suffixIcon: Icon(Icons.location_city,color: Colors.white,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1,color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2,color: Colors.white)
                  )
                ),
                onChanged: (value){
                  cityName = value;
                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(

                  onPressed: (){
                  if(cityName == null || cityName!.trim().isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter City Name")));
                  }else{

                  Navigator.of(context).pop(cityName);}
                },child: Text("Enter",style: GoogleFonts.abrilFatface(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),),
              ),
            ),
            SizedBox(height: 250,)
          ],
        ),
      ),
    );
  }
}
