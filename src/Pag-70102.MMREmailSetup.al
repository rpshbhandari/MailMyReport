page 70102 "MMR Email Setup"
{
    PageType = List;
    SourceTable = "MMR Email Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MMR Email Setup';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Report ID"; Rec."Report ID")
                {
                }

                field(Enabled; Rec.Enabled)
                {
                }

                field("Subject Template"; Rec."Subject Template")
                {
                }

                field("Send As HTML"; Rec."Send As HTML")
                {
                }

                field("Attach Report"; Rec."Attach Report")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ManageRecipients)
            {
                Caption = 'Recipients';
                ApplicationArea = All;
                Image = Users;

                trigger OnAction()
                var
                    Recipient: Record "MMR Report Recipient";
                begin
                    Recipient.SetRange("Setup Entry No.", Rec."Entry No.");
                    Page.Run(Page::"MMR Email Recipients", Recipient);
                end;
            }
            
        }
    }
}