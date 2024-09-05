// package com.app.landlord;
// import android.annotation.SuppressLint
// import com.courier.android.notifications.presentNotification
// import com.courier.android.service.CourierService
// import com.google.firebase.messaging.RemoteMessage

// // It's OK to do SuppressLint because CourierService  will handle token refreshes automatically .
// @SuppressLint("MissingFirebaseInstanceTokenRefresh")
// class NotificationService: CourierService() {

//     override fun showNotification(message: RemoteMessage) {
//         super.showNotification(message)

//         // TODO: This is where you will customize the notification that is shown to your users
//         // For Flutter, there is usually no need to change the handlingClass
//         // See
//         // https://developer.android.com/develop/ui/views/notifications/build-notification
//     // for more details on customizing an Android notification.

//         message.presentNotification(
//             context = this,
//             handlingClass = MainActivity::class.java,
//             icon = android.R.drawable.ic_dialog_info
//         )
//     }
// }