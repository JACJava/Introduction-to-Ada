--------------------------------------------------------------------
-- HAILSTONES
-- Purpose:
-- Demonstrate subprograms in Ada by using the hailstone code kata. The program should achieve
-- two goals.
-- 1. Generate a sequence for the value 27. Print out the results,
--    and visually validate the sequence has 112 steps.
--    The sequence should start with with 27, 82, 41, 124 and
--    end with 8, 4, 2, 1
-- 2. Find the longest hailstone sequence for the positive values
--    below 100,000
-- The hailstone mathematical sequence adheres to the following rules
-- 1. if n =1 the Sequence is over
-- 2. if n is even then divide n by 2
-- 3. if n is odd then the next value of n = (n *3) + 1
-- References:
-- http://rosettacode.org/wiki/Hailstone_sequence
-- https://en.wikipedia.org/wiki/Collatz_conjecture
--------------------------------------------------------------------
with Ada.Text_IO;

procedure Main is

   package TIO renames Ada.Text_IO;
   package IIO is new TIO.Integer_IO (Integer);

   MAX_STEP : constant Positive := 5_000;


   MAX_NUMBER_TEST : constant Positive := 100_000;

--------------------------------------------------------------------
   function Next_Stone (This_Number : in out Positive) return Boolean is
   begin
      if This_Number = 1 then
         return False;
      elsif (This_Number rem 2) = 0 then
         This_Number := This_Number / 2;
      else
         This_Number := (This_Number * 3) + 1;
      end if;
      return True;
   end Next_Stone;
   --------------------------------------------------------------------
   procedure Print_Result (Step, Sequence_Value : Positive) is
   begin
      TIO.Put ("Step: " & Integer'Image (Step));
      IIO.Put (Sequence_Value);
      TIO.New_Line;
   end Print_Result;
   --------------------------------------------------------------------
   function KeepLooping (Current_Step : Positive) return Boolean is
   begin
      return Current_Step < MAX_STEP;
   end KeepLooping;
   --------------------------------------------------------------------
   function Generate_Sequence
     (Output_Enabled : Boolean := False;
      Start_Value    : Positive) return Positive is
      Value : Positive := Start_Value;
      Step  : Positive := 1;
   begin
      while Next_Stone (Value) loop
         Step := Step + 1;
         if Output_Enabled then
            Print_Result (Step, Value);
         end if;
         if (KeepLooping (Step) /= True) then
            TIO.Put_Line ("ERROR: Maximum number of steps reached.");
            return MAX_STEP + 1;
         end if;
      end loop;
      return Step;
   end Generate_Sequence;
      --------------------------------------------------------------------
   procedure Find_Longest_Sequence (Longest_Value, Longest_Length : out Positive) is
      Value  : Positive := MAX_NUMBER_TEST;
      Length : Positive := 1;
   begin
      Longest_Value  := 1;
      Longest_Length := 1;
      while Value > 1 loop
         Length := Generate_Sequence (Start_Value => Value);
         if Length > Longest_Length then
            Longest_Length := Length;
            Longest_Value  := Value;
         end if;
         Value  := Value - 1;
      end loop;
   end Find_Longest_Sequence;
      --------------------------------------------------------------------
   procedure Print_Longest_Sequence (Value, Upper_Limit, Longest : Positive) is
   begin
      IIO.Put (Value);
      TIO.Put (" generated the longest sequence between 1 and ");
      IIO.Put (Upper_Limit);
      TIO.Put (" with a length of: ");
      IIO.Put (Longest);
      TIO.New_Line;
   end Print_Longest_Sequence;
   --------------------------------------------------------------------
   Test_Value : Positive := 27;
   Length     : Positive;
   Longest_Value, Longest_Length : Positive;
--==================================================================
begin
   TIO.Put ("Starting with value: " & Positive'Image (Test_Value));
   Length := Generate_Sequence (Output_Enabled => True, Start_Value => Test_Value);
   Find_Longest_Sequence(Longest_Value, Longest_Length);
   Print_Longest_Sequence( Value => Longest_Value,
   Upper_Limit => MAX_NUMBER_TEST,
   Longest => Longest_Length);

end Main;
