import 'package:flutter/material.dart';
import 'package:mindease_app/MainSelection.dart';
import 'styles.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage ({super.key});
    // 1: selected the symptoms
    // 2: each button lead to different corrosponding page
    // 3. 'Lets Get Started' button leads to MainUser Interface
    //                                       -contains 3 platforms(Daily/ Social/ Settings)
    
  @override
   Widget build(BuildContext context){
    // to adjust the icon size accorading to screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth / 3; // affects the size of each icon.Each of them takes up 1/3 of screen width
    
    int columnNum = 2;
    
    var contaminationSymptom = Icons.clean_hands;
    var intrusiveThought     = Icons.pan_tool;
    var symmetryAndOrder     = Icons.balance;
    var hoarding             = Icons.inventory;
    var ruminations          = Icons.church; 
    var other                = Icons.diversity_3;

    String contaminationInfo = ('The fear of being dirty and contamination is the obsessional worry, often fear is that contamination might cause harm to ones self or a loved one. The common compulsions might be to wash or clean or avoid. ');
    String intrusivethoughtInfo = ('In the context of OCD, are where a person generally suffers with obsessional thoughts that are repetitive, disturbing and often horrific and repugnant in nature, for example, thoughts of causing violent or sexual harm to loved ones which do not involve specific immediate compulsions these are called Intrusive Thoughts');
    String symmetryandorderInfo = ('The need to have everything lined up symmetrically just ‘right’ is the compulsion, the obsessive fear might be to ensure everything feels ‘just right’ to prevent discomfort or sometimes to prevent harm occurring ');
    String hoardingInfo = ('Hoarding Disorder is a condition where a person struggles to discard useless or worn out possessions, acquires an excessive number of items and stores them, usually in a chaotic manner resulting in unmanageable clutter.');
    String ruminationInfo = ('Unlike obsessional thoughts, ruminations are not objectionable and are indulged rather than resisted. Many ruminations dwell on religious, philosophical, or metaphysical topics, such as the origins of the universe, life after death, the nature of morality, and so on. One such example might be where a person dwells on the time-consuming question: Is everyone basically good?. They would ruminate on this for a long period of time, going over in their mind various considerations and arguments, and contemplating what superficially appeared to them to be compelling evidence.');
    String otherInfo = ('There are many other types of OCD. Do not worry if your symptoms donot fit any of them!');

    return Scaffold(
      appBar: AppBar( 
        // BACK BUTTON SETUP
          leading: IconButton(
            icon: Icon(backBtn),
          onPressed:(){
            Navigator.pop(context);
          },
          ),
        ),

    body: SingleChildScrollView(
       padding: EdgeInsets.all(16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children:[
             Text(
              'Please Long Press to select the symptoms that apply to you',
              style: TextStyle(
                fontSize: 15,
                color: White,
              ),
            ),
            Text('Click on it to read more information',
               style: TextStyle(
                fontSize: 15,
                color: White,
               ),


               
              ),
            SizedBox(height: normalSizedGap),

     // 2*3 BUTTON SETUP
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: columnNum,
              childAspectRatio: 1.0, //Aspect ratio 1:1
              physics: NeverScrollableScrollPhysics(), //Disable scrolling of the grid
              children: [
                SymptomIcon(iconData: contaminationSymptom,
                             label: 'Contamination Obsession', 
                             iconSize: iconSize,
                             onTap:(){
                              showSymptomSnackbar(context, 'Contamination Obsession', contaminationInfo,);
                             },),
                SymptomIcon(iconData: intrusiveThought, 
                            label: 'Intrusive Thoughts', 
                            iconSize: iconSize,
                            onTap:(){
                              showSymptomSnackbar(context, 'Intrusive Thoughts', intrusivethoughtInfo);
                             },),
                SymptomIcon(iconData: symmetryAndOrder,
                            label: 'Symmetry and Orderliness',
                            iconSize: iconSize,
                            onTap:(){
                              showSymptomSnackbar(context, 'Symmetry and Orderliness', symmetryandorderInfo,);
                             },),
                SymptomIcon(iconData: hoarding, 
                            label: 'Hoarding', 
                            iconSize: iconSize,
                            onTap:(){
                              showSymptomSnackbar(context, 'Hoarding', hoardingInfo,);
                             },),
                SymptomIcon(iconData: ruminations, 
                            label: 'Rumination Obsession', 
                            iconSize: iconSize,
                            onTap:(){
                              showSymptomSnackbar(context, 'Rumination Obsession', ruminationInfo,);
                             },),
                SymptomIcon(iconData: other, 
                            label: 'Oter Types of OCD', 
                            iconSize: iconSize,
                            onTap:(){
                              showSymptomSnackbar(context, 'Existential OCD', otherInfo,);
                             },
                             ),
              ],
              ),
              SizedBox(height: 15),
    // NAVIGATION TO DAILY SECTION
              ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,
                     MaterialPageRoute(
                       builder: (context) => MainSelection() 
                       ),
                      );
                }
              , child: Text('Continue'),
              )
          ]
         ),
        ),
      );
  }
}



//METHOD CALLED TO BUILD FLOATING SNACKBAR FOR EACH OCD TYPE
void showSymptomSnackbar(BuildContext context, String title, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 5),
    )
  );
}


// SET UP SECTION FOR EACH SYMPTOM ICON
//   INCLUDE: SIZE,SCREEN LOCATION, ICON CONTENT, CLICK RESPONSE
class SymptomIcon extends StatefulWidget{
  final IconData iconData;
  final String label;
  final double iconSize;
  final VoidCallback onTap;

  const SymptomIcon({ // call requirements
    Key? key,
    required this.iconData,
    required this.label,
    required this.iconSize,
    required this.onTap,
  }): super(key: key);

  @override
  State<SymptomIcon> createState() => _SymptomIconState();
}

class _SymptomIconState extends State<SymptomIcon> {
  bool _isSelected = false;

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),

      //TICK BOX SETUP
      child: InkWell(
        onLongPress:(){
          setState( (){
            _isSelected =! _isSelected;
          });
        },
        child: ElevatedButton(
          onPressed: widget.onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Stack(
      alignment: Alignment.topLeft,
      children: [
       SizedBox(
         width: widget.iconSize,
         height: widget.iconSize,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(widget.iconData, 
                  size: widget.iconSize*.6,
                  ), // can be adjusted
             SizedBox(height:2),
             Text(
               widget.label, 
               textAlign: TextAlign.center, 
               style: TextStyle(fontSize: 12),
               ),
             ],
           ),
         ),
         if(_isSelected)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: 
              Icon(
                Icons.check,
                color:Colors.blueGrey[500],
                size: 40),
                ),
               ],
             )
            )
           ),
          );
         }
       }