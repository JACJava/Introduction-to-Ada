with Ada.Text_IO;

procedure Main is

   package TIO renames Ada.Text_IO;
   Duplicated : Integer := 10;
   procedure New_Proc is
      Duplicated : Integer := 200;
   begin
      TIO.Put_Line (Integer'Image (Duplicated));
   end New_Proc;

begin
   New_Proc;
   TIO.Put_Line (Integer'Image (Duplicated));
   Outer_Block :
   declare
      Duplicated : Float := 20.0;
   begin
      TIO.Put_Line (Float'Image (Duplicated));
      TIO.Put_Line (Integer'Image (Main.Duplicated));
      declare
         Duplicated : Integer := 100;
      begin
         TIO.Put_Line (Integer'Image (Duplicated));
         TIO.Put_Line (Float'Image (Outer_Block.Duplicated));
      end;
   end Outer_Block;
end Main;
--
--
--
--
--
--     procedure New_Proc is
--        Duplicated : Integer := 200;
--     begin
--        TIO.Put_Line (Integer'Image (Duplicated));
--     end New_Proc;
--
--  begin
--     New_Proc;
--     TIO.Put_Line (Integer'Image (Duplicated));
--     Outer_Block :
--     declare
--        Duplicated : Float := 20.0;
--     begin
--        TIO.Put_Line (Float'Image (Duplicated));
--        TIO.Put_Line (Integer'Image (Main.Duplicated));
--        declare
--           Duplicated : Integer := 100;
--        begin
--           TIO.Put_Line (Integer'Image (Duplicated));
--           TIO.Put_Line (Float'Image (Outer_Block.Duplicated));
--
--        end;
--     end Outer_Block;
--  end Main;
