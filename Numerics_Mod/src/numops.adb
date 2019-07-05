-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************

with Ada.Text_IO;

procedure NumOps is

   package TIO renames Ada.Text_IO;
   package IIO is new TIO.Integer_IO (Integer);
   --package FIO is new TIO.Float_IO (Float);
   type Mod_Byte is mod 256;
   package MIO is new TIO.Modular_IO (Mod_Byte);

   Test_Mod : Mod_Byte := 16#FF#;

begin
   TIO.Put ("Modular Test for Julie");
   MIO.Put (Test_Mod);
   Test_Mod := Test_Mod and 7;
   MIO.Put (Test_Mod);
   MIO.Put (Test_Mod + 255);
   -- MIO.Put (Test_Mod + 256); note:  won't work
   MIO.Put (Test_Mod or 16#FF#);
   MIO.Put (Test_Mod * 16);
   TIO.New_Line;

end NumOps;
