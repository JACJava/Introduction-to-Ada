-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure NumOps is
   package TIO renames Ada.Text_IO;
   package FIO is new TIO.Float_IO (Float);
   My_Float : Float    := 123.55678987654321;
   Divisor : Float := 1.0;
   type Mini_Real is digits 6;
   package SIO is new TIO.Float_IO(Mini_Real);
   Probability : Mini_Real range 0.0 .. 50.505 := 35.0;


begin
   SIO.Put(Probability);Tio.New_Line;
   TIO.Put_Line ("Real Attribute Test");
   TIO.Put_Line("Common   ");
   TIO.Put("   Orig: ");FIO.Put(My_Float,3,8,0);
   TIO.Put("   Ceil: ");FIO.Put(Float'Ceiling(My_Float),3,3,0);
   TIO.Put("      Floor: ");FIO.Put(Float'Floor(My_Float),3,3,0); Tio.New_Line;
   TIO.Put("  Trunc: ");FIO.Put(Float'Truncation(My_Float),3,3,0);
   TIO.Put("      Round: ");FIO.Put(Float'Rounding(My_Float),3,3,0);
   TIO.Put("   Remainder: "); FIO.Put(Float'Remainder(My_Float,Divisor),3,6,0);
   TIO.New_Line;
   TIO.Put("Epsilon: ");FIO.Put(Float'Model_Epsilon,0,24,0);
end NumOps;
