using System;
using System.IO;

namespace BitplaneOptimizer
{
    class RelationOfColors {
      public int[] counters = new int[17];
    }

    class Program
    {
        static string File2Optimize = "input.chk";  

        static void Main(string[] args) {
            RelationOfColors[] relationofcolors = new RelationOfColors[17];
            for( int i=0;i<17;i++) 
              relationofcolors[i] = new RelationOfColors();
            
            int lastcolor = 16;

            Console.WriteLine("Hello World!");
            using( FileStream fs = File.Open(  File2Optimize, FileMode.Open, 
                                                             FileAccess.Read)) {
              byte[] b = new byte[1];
              while( fs.Read( b, 0, 1) > 0) {
                relationofcolors[lastcolor].counters[b[0]]++;
                relationofcolors[b[0]].counters[lastcolor]++;
                lastcolor = b[0];
              }
            }

            for( int i=0;i<17;i++) 
              for(int i2=0;i2<17;i2++) 
              Console.WriteLine( "Color[{0},{1}] = {2}", i, i2, 
                                              relationofcolors[i].counters[i2]);      
        }
    }
}

//2.6313084e+35
//20'922'789'888'000