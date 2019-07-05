-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   Outer_Index : Integer  := 0;
   Inner_Index : Integer  := 0;
   Inner_Max   : constant := 5;
   Outer_Max   : constant := 6;
   type Suit is (Clubs, Diamonds, Hearts, Spades, No_Trumps);

begin
   TIO.Put ("Named Loop Test ");
   Outer :
   loop
      Outer_Index := Outer_Index + 1;
      loop
         Inner_Index := Inner_Index + 1;
         TIO.Put (".");
         exit Outer when Outer_Index = Outer_Max;
         exit when Inner_Index rem Inner_Max = 0;
      end loop;
      TIO.New_Line;
   end loop Outer;
   TIO.Put_Line
     ("Named Loops Outer:" &
      Integer'Image (Outer_Index) &
      " Inner:" &
      Integer'Image (Inner_Index));

   TIO.Put_Line ("Suit List ");
   for Test_Suit in Suit loop
      TIO.Put_Line (Suit'Image (Test_Suit));
   end loop;

   TIO.Put_Line("Implicit constrained type Clubs .. Spades");
   for Test_Suit in Clubs .. Spades loop
      TIO.Put_Line (Suit'Image (Test_Suit));
   end loop;

   TIO.Put_Line("Explicit constrained Suit Hearts..Spades ");
   for Test_Suit in Suit range Hearts .. Spades loop
      TIO.Put_Line (Suit'Image (Test_Suit));
   end loop;

   for I in Integer range 1.. Inner_Index loop
      if I rem 2 = 0 then goto Continue_Here; end if;
      TIO.Put_Line(Integer'Image(I));
      Inner_Index :=50;
      <<Continue_Here>>
   end loop;

end Main;
