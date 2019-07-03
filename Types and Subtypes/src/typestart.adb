-- *******************************************************************
-- *                                                                 *
-- * 20190703  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

procedure Typestart is
 package TIO renames Ada.Text_IO;
 package IIO renames Ada.Integer_Text_IO;
 package FIO renames Ada.Float_Text_IO;

-- X: Standard.Integer := 1;
-- Y: Standard.Float := 1.0;

--   type Car_Speed_Kph is range 0 .. 300;
--   type Car_Speed_Mph is range 0 .. 190;
--   My_Speed_US: Car_Speed_Mph := 100;
--   My_Speed_World: Car_Speed_Kph := 160;
--
--   type Speed is range 0 .. 300;
--   subtype Speed_Kph is Speed;
--   subtype Speed_Mph is Speed range 0 .. 190;
--   Speed_Us : Speed_Mph := 100;
--   Speed_World : Speed_Kph := 160;

 --  Use constants instead of all those hardcoded numbers
 Min_Speed : constant Integer := 0;
 Max_Speed_Kph : constant Integer := 300;
 Max_Speed_Mph : constant Integer := 190;

 type Car_Speed_Kph is range Min_Speed .. Max_Speed_Kph;
 type Car_Speed_Mph is range Min_Speed .. Max_Speed_Mph;
 Start_Car_Speed_Kph : constant := 160;
 Start_Car_Speed_Mph : constant := 100;

 My_Speed_US: Car_Speed_Mph := Start_Car_Speed_Mph;
 My_Speed_World: Car_Speed_Kph := Start_Car_Speed_Kph;

 type Speed is range Min_Speed .. Max_Speed_Kph;
 subtype Speed_Kph is Speed;
 Start_Speed_Kph : constant := Speed(Start_Car_Speed_Kph);
 Start_Speed_Mph : constant := Speed(Start_Car_Speed_Mph);

 subtype Speed_Mph is Speed range Speed(Min_Speed) .. Speed(Max_Speed_Mph);
 Speed_Us : Speed_Mph := Start_Speed_Mph;
 Speed_World : Speed_Kph := Start_Speed_Kph;

 Mult : Integer;


begin
--   TIO.Put_Line ("X and Y are ");
--   IIO.Put(X);
--   FIO.Put(Y);

-- can't assign one type to another
--   My_Speed_World := My_Speed_US;

-- can get it to work if you recast it
--  My_Speed_World := Car_Speed_Kph(My_Speed_US);

-- but why do that?  create subtypes instead
-- Speed_World := Speed_US;

 -- but us can't hold all the world speeds -- bus same base type so it's okay
 -- plus speed_kph is set at 160 for this one, and fails when it's 200
 -- or even when it's set below and mathmatically increased above...
 -- will fail to compile!  how smart!!
-- Speed_US := Speed_World * 2;

 -- how about if we ask for an multiplier from the console?
 -- will compile, but will give a runtime error
 TIO.Put_Line("Please Enter a Multiplier...");
 IIO.Get(Mult);
 Speed_US := Speed_World * Speed(Mult);


end Typestart;
