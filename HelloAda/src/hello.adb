-- *******************************************************************
-- *                                                                 *
-- * 20190703  Initial creation                                      *
-- *                                                                 *
-- * NOTE!  Ada is not case sensitive!                               *
-- *******************************************************************
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Hello is

   package IO renames Ada.Text_IO;
   X : Integer := 10;

begin
   IO.Put_Line("Hello Ada 2019!!!" & "   Hello Julie, too!!  " & Integer'Image(X));
   IO.Put("Hello Ada 2019 Again!!!");

   Ada.Integer_Text_IO.Put(X);
   IO.New_Line;

end Hello;
