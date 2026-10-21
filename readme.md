# MailMyReport

Email reports to configured recipients in Microsoft Dynamics 365 Business Central.

## Overview

MailMyReport is a Business Central extension that enables automated email delivery of generated reports. Rather than manually sending reports, you can configure which reports should be emailed to whom, customize the subject and body of outgoing emails, and control delivery behavior per report.

## Features

- **Per-Report Configuration**: Set up email distribution for individual reports with report ID-based routing
- **Recipient Management**: Maintain a list of email addresses for each report setup; easily add, remove, or deactivate recipients
- **Custom Email Templates**: Define subject and body templates for each report, with support for placeholders like report name and timestamp
- **Flexible Delivery Options**:
  - Toggle attachment inclusion per report
  - Choose between HTML and plain-text email format
  - Enable or disable distribution at any time
- **User-Friendly Interface**: 
  - Setup page accessible from the Report Inbox
  - Inline recipient management from the setup list
  - Send Email action on Report Inbox records

## Quick Start

### 1. Install the Extension

Download the zip from [Releases](https://github.com/rpshbhandari/MailMyReport/releases), extract the `.app` and deploy it to your Business Central environment.

### 2. Configure a Report

1. Go to **Report Inbox** > **Email Setup** (new action on the ribbon)
2. Create a new setup record:
   - **Report ID**: Enter the ID of the report you want to email
   - **Enabled**: Check this box to activate the setup
   - **Subject Template**: (Optional) Enter a custom subject, e.g., `"Monthly Report: %1"`
   - **Send As HTML**: Choose whether emails should use HTML formatting
   - **Attach Report**: Check to include the report output as an attachment

### 3. Add Recipients

From the Email Setup page:
1. Select the setup you created
2. Click **Recipients**
3. Add email addresses and mark them as **Active**

### 4. Send an Email

When a report appears in the Report Inbox:
1. Select the record
2. Click **Send Email** to distribute it to all active recipients for that report

## Objects Reference

### Tables

| ID | Name | Purpose |
|---|---|---|
| 70101 | MMR Report Recipient | Stores email addresses linked to a report setup |
| 70102 | MMR Email Setup | Defines email routing and formatting for each report |

### Pages

| ID | Name | Purpose |
|---|---|---|
| 70102 | MMR Email Setup | List and edit report email configurations |
| 70103 | MMR Email Recipients | Add and manage email recipients for a setup |

### Extensions

| ID | Name | Purpose |
|---|---|---|
| 70100 |  Report Inbox Extension | Adds "Send Email" and "Email Setup" actions |

### Codeunits

| ID | Name | Purpose |
|---|---|---|
| 70100 | MMR Email Management | Core email sending logic; validates recipients, builds messages, and dispatches emails |

## Configuration Details

### Subject and Body Templates

Templates support the following placeholders:
- `%1` — Report description or name
- `%2` — Report generation date/time

**Example:**
- Subject: `"Updated: %1 (%2)"`
- Body: `"Report %1 was generated on %2. Please review the attached file."`

If templates are left blank, the extension uses default text.

### Validation

- Recipient email addresses cannot be empty
- A report must have at least one active recipient to send
- The report ID in the setup must match the Report Inbox record's Report ID
- Attachment format (PDF, Excel) is validated; unsupported types raise an error

## Architecture

The extension follows a simple three-layer model:

1. **UI Layer**: Pages for setup and recipient management; actions on Report Inbox
2. **Business Logic**: Email Management codeunit validates configuration, retrieves report data, and sends messages
3. **Data Layer**: Setup and recipient tables hold configuration; tight linkage via foreign keys ensures data integrity

Email sending is initiated manually from the Report Inbox page; there is no automatic trigger on report generation.

## Troubleshooting

### "No enabled email setup was found for report X"
The Report Inbox entry's Report ID does not match any enabled setup record. Create or enable a setup for that report ID.

### "At least one active recipient must be configured for the selected report"
The setup exists but has no active recipients. Go to the setup's Recipients page and add at least one address.

### "Email Address cannot be empty"
You attempted to save a recipient record with a blank email field. Enter a valid address.

### "Unsupported output type X for report Y"
The report generated output in a format other than PDF or Excel. Verify the report's output configuration.

## Support & Documentation

For general Business Central email configuration, see [Microsoft Learn: Email Setup](https://learn.microsoft.com/dynamics365/business-central/).


## License & Source Code Availability
This project is licensed under the **GNU Affero General Public License v3.0 (AGPLv3)**.
### What this means for Business Central Partners & ISVs:
* **Reciprocity Required:** You are free to use, modify, and extend this app. However, if you modify this code and run it as part of a hosted, SaaS, or BC Online service (or distribute compiled `.app` packages), **you must make your modified source code publicly available under the AGPLv3 license**.
* **BC Resource Exposure Policy:** Any distributed `.app` builds derived from this source must maintain full source access for users. In `app.json`, you must set:
 ```json
 "resourceExposurePolicy": {
     "allowDebugging": true,
     "allowDownloadingSource": true,
     "includeSourceInSymbolFile": true
 }
```
---

**Version:** 1.0.0.0  
**Compatibility:** Business Central 2026 Wave 1 (v28+), Runtime 17.0+
