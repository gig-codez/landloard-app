import '/tools/index.dart';

import '/exports/exports.dart';

class RejectBottomMenu extends StatefulWidget {
  final String tenantId;
  final String complaintId;
  const RejectBottomMenu({super.key, required this.tenantId, required this.complaintId});

  @override
  State<RejectBottomMenu> createState() => _RejectBottomMenuState();
}

class _RejectBottomMenuState extends State<RejectBottomMenu> {
  String reason = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 18.0, right: 18, left: 18, bottom: 10),
          child: Text(
            "Decline the complaint or negotiation with a reason..",
            style: TextStyles(context).getBoldStyle(),
          ),
        ),
        const Divider(),
        const Space(space: 0.04),
        RadioMenuButton(
          value: "Pay 80% of the amount required",
          groupValue: reason,
          onChanged: (x) {
            setState(() {
              reason = x ?? "";
            });
          },
          child: Text(
            "Pay 80% of the amount required",
            style: TextStyles(context).getRegularStyle(),
          ),
        ),
        RadioMenuButton(
          value: "Pay 50% of the amount required",
          groupValue: reason,
          onChanged: (x) {
            setState(() {
              reason = x ?? "";
            });
          },
          child: Text(
            "Pay 50% of the amount required",
            style: TextStyles(context).getRegularStyle(),
          ),
        ),
        RadioMenuButton(
          value: "Pay 20% of the amount required",
          groupValue: reason,
          onChanged: (x) {
            setState(() {
              reason = x ?? "";
            });
          },
          child: Text(
            "Pay 20% of the amount required",
            style: TextStyles(context).getRegularStyle(),
          ),
        ),
        RadioMenuButton(
          value: "Pay 10% of the amount required",
          groupValue: reason,
          onChanged: (x) {
            setState(() {
              reason = x ?? "";
            });
          },
          child: Text(
            "Pay 10% of the amount required",
            style: TextStyles(context).getRegularStyle(),
          ),
        ),
        CommonButton(
          buttonText: "Reject",
          onTap: () {
            if (reason.isNotEmpty) {
              handleIssue(widget.tenantId, widget.complaintId, "off", "Rejected",reason);

              Navigator.pop(context);
// success Message,
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  dismissDirection: DismissDirection.up,
                  backgroundColor: Colors.green.shade300,
                  content: Text(
                    "Rejected the complaint successfully",
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(fontSize: 17),
                  ),
                ),
              );
            } else {
              Routes.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    "Please select a reason",
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(fontSize: 18),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
