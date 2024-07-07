abstract class FuncDate{
  FuncDate._();

 static int month=DateTime.now().month;
  static int day=DateTime.now().weekday;

static String getMonth(){
   String value="";
    if(month==1){
      value="Yanvar";
    }
    else if(month==2){
      value="Fevral";
    }
    else if(month==3){
      value="Mart";
    }
    else if(month==4){
      value="Aprel";
    }
    else if(month==5){
      value="May";
    }
    else if(month==6){
      value="Iyun";
    }
    else if(month==7){
      value="Iyul";
    }
    else if(month==8){
      value="Avgust";
    }
    else if(month==9){
      value="Sentabr";
    }
    else if(month==10){
      value="Oktabr";
    }
    else if(month==11){
      value="Noyabr";
    }
    else if(month==12){
      value="Dekabr";
    }

    return value;
  }

static String getDay(){
  String value="";

  if(day==1){
    value="Dushanba";
  }
  else if(day==2){
    value="Seyshanba";
  }
  else if(day==3){
    value="Chorshanba";
  }
  else if(day==4){
    value="Payshanba";
  }
  else if(day==5){
    value="Juma";
  }
  else if(day==6){
    value="Shanba";
  }
  else if(day==7){
    value="Yakshanba";
  }
  return value;
  }

}