page 70103 "MMR Email Recipients"
{
    PageType = List;
    SourceTable = "MMR Report Recipient";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MMR Email Recipients';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Setup Entry No."; Rec."Setup Entry No.")
                {
                }

                field("Email Address"; Rec."Email Address")
                {
                }

                field(Active; Rec.Active)
                {
                }
            }
        }
    }
}