with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   package IIO renames Ada.Integer_Text_IO;

   type Vulnerability is (Not_Vulnerable, Vulnerable);
   type Insult is (Undoubled, Doubled, Redoubled);
   type Tricks is (First, TwoAndThree, FourPlus);
   type Penalty_Matrix is array (Vulnerability, Insult, Tricks) of Integer;
   Penalty_Points : Penalty_Matrix :=
     (Not_Vulnerable =>
        (Undoubled => (50, 50, 50),
         Doubled   => (100, 200, 300),
         Redoubled => (200, 400, 600)),
      Vulnerable =>
        (Undoubled => (100, 100, 100),
         Doubled   => (200, 300, 300),
         Redoubled => (400, 600, 600)));

   Pad : String (1 .. 8) := "        ";
   subtype Trick_Range is Integer range 1 .. 13;
   Down_By : array (Trick_Range) of Tricks :=
     (1 => First, 2 | 3 => TwoAndThree, others => FourPlus);

   Vulnerable_Status : Vulnerability;
   Insult_Status     : Insult;
   User_Input1       : Character;
   User_Input2       : String (1 .. 2) := "  ";
   Tricks_Down       : Trick_Range;
   Total_Penalty     : Integer         := 0;
   Last              : Natural;
   Points_Per_Trick  : Integer;

begin
   for Points of Penalty_Points loop
      IIO.Put (Points);
   end loop;

   for V in Vulnerability loop
      TIO.Put_Line (Vulnerability'Image (V));
      for I in Insult loop
         TIO.Put_Line (" " & Insult'Image (I));
         for T in Tricks loop
            TIO.Put
              (case T is
                 when First       => Pad,
                 when TwoAndThree => Pad (1 .. 2),
                 when FourPlus    => Pad (1 .. 5));
            TIO.Put (Tricks'Image (T));
            IIO.Put (Penalty_Points (V, I, T));
            TIO.New_Line;
         end loop;
         TIO.New_Line;
      end loop;
   end loop;

   TIO.Put_Line ("Is the player Vulnerable (Y/N)?");
   TIO.Get (User_Input1);
   if User_Input1 = 'Y' or else User_Input1 = 'y' then
      Vulnerable_Status := Vulnerable;
   else
      Vulnerable_Status := Not_Vulnerable;
   end if;
   TIO.Put_Line ("What is the insult (U/D/R) ?");
   TIO.Get (User_Input1);
   Insult_Status :=
     (case User_Input1 is
        when 'N' | 'n' => Undoubled,
        when 'D' | 'd' => Doubled,
        when 'R' | 'r' => Redoubled,
        when others    => Undoubled);
   TIO.Skip_Line;
   TIO.Put_Line ("Down by how many tricks (1..13)?");
   TIO.Get_Line (User_Input2, Last);
   Tricks_Down := Trick_Range'Value (User_Input2);

   for I in 1 .. Tricks_Down loop
      Points_Per_Trick :=
        Penalty_Points (Vulnerable_Status, Insult_Status, Down_By (I));
      Total_Penalty := Total_Penalty + Points_Per_Trick;
   end loop;

   TIO.Put_Line
     (Vulnerability'Image (Vulnerable_Status) &
      " " &
      Insult'Image (Insult_Status) &
      " and down by " &
      Integer'Image (Tricks_Down) &
      " costs:" &
      Integer'Image (Total_Penalty));

end Main;
