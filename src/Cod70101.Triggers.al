codeunit 70101 Triggers
{

    [EventSubscriber(ObjectType::Table, Database::"Report Inbox", 'OnAfterInsertEvent', '', false, false)]
    local procedure MyProcedure(var Rec: Record "Report Inbox")
    var
        MRREmailManagement: Codeunit "MMR Email Management";
    begin
        Rec.Read := MRREmailManagement.SendReportEmail(Rec."Entry No.");
    end;
}