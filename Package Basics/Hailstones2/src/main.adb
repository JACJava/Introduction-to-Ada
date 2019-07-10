with Ada.Text_IO;
with Hail;

procedure Main is

   package TIO renames Ada.Text_IO;
   package IIO is new TIO.Integer_IO (Integer);

   --------------------------------------------------------------------
   Test_Value                    : Positive := 27;
   Length                        : Positive;
   Longest_Value, Longest_Length : Positive;
--==================================================================
begin
   TIO.Put ("Starting with value: " & Positive'Image (Test_Value));
   Length :=
     Hail.Generate_Sequence
       (Output_Enabled => True,
        Start_Value    => Test_Value);
   Hail.Find_Longest_Sequence (Longest_Value, Longest_Length);
   Hail.Print_Longest_Sequence
     (Value       => Longest_Value,
      Upper_Limit => Hail.Get_Max_Number,
      Longest     => Longest_Length);

end Main;
