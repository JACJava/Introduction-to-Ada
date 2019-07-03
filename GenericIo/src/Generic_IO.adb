-- *******************************************************************
-- *                                                                 *
-- * 20190703  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;
with Ada.Integer_Text_IO;
-- with Ada.Text_IO.Integer_IO;

procedure Generic_IO is

   package TIO renames  Ada.Text_IO;
   package IIO renames  Ada.Integer_Text_IO;

   Int_Sub : Positive := 1;

   type My_Int is new Integer;
   package New_IO is new TIO.Integer_Io(My_Int);
   Test_New : My_Int := 1;

begin

   TIO.Put("Int_Sub is:  ");
   IIO.Put(Int_Sub);
   TIO.Put(" ");

   TIO.Put("Test_New is:  ");
   New_IO.Put(Test_New);

end Generic_IO;
