class Complex{
  
  double real;
  double imag;
  
  Complex(double re, double im){
    this.real = re;
    this.imag = im;
  }
  
  void add(double r, double i){
    this.real += r;
    this.imag += i;
  }
  
  void sq(){
    double r = this.real;
    double i = this.imag;
    this.real = Math.pow(r, 2) - Math.pow(i, 2);
    this.imag = 2 * r * i;
  }
  
  double len(){
    return Math.sqrt(Math.pow(real, 2)+Math.pow(imag, 2));
  }
  /*
  boolean inTheSet(){
    Complex a = new Complex(0,0);
    for(int i = 0; i < 1000; i++){
      a.sq();
      a.add(this.real, this.imag);
    }
    return (a.real < 1000 || (a.real > -1000)) && (a.imag < 1000 || (a.imag > -1000));
  }*/
  
  int inTheSet(){
    Complex a = new Complex(0,0);
    int k = 0;
    int t = 10;
    int l = 2000;
    while((a.real < t || (a.real > -t)) && (a.imag < t || (a.imag > -t))){
      a.sq();
      a.add(this.real, this.imag);
      k++;
      if(k > l){
        return -1;
      }
    }
    return k;
  }
  
  color col(){
    Complex a = new Complex(0,0);
    for(int i = 0; i < 1000; i++){
      a.sq();
      a.add(this.real, this.imag);
    }
    if((a.real < 1000 || (a.real > -1000)) && (a.imag < 1000 || (a.imag > -1000))){
      return color((int)(255.0*Math.abs(a.real)/1000.0), (int)(255.0*Math.abs(a.imag)/1000.0), 255);
    }
    return color(0);
  }
}
