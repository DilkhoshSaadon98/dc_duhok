const functions = require('firebase-functions');
const admin = require('dilkhosh_saadon');
admin.initializeApp();

exports.sendCustomVerificationEmail = functions.auth.user().onCreate((user) => {
  const displayName = user.displayName || 'Dilkhosh'; // Get the user's display name

  // Send a custom verification email
  const actionCodeSettings = {
    url: 'https://example.com', // URL to redirect the user to after email verification
    handleCodeInApp: true, // Open the app when the link is clicked
  };

  return admin
    .auth()
    .generateEmailVerificationLink(user.email, actionCodeSettings)
    .then((link) => {
      const mailOptions = {
        from: 'dilkhosh.saadon@gmail.com',
        to: user.email,
        subject: 'Verify your email address',
        text: `Hello ${displayName},\n\nWelcome to our app! Please click the following link to verify your email address:\n\n${link}`,
      };

      return admin
        .firestore()
        .collection('dilkhosh.saadon@gmail.com')
        .add(mailOptions)
        .then(() => {
          console.log('Verification email sent');
        })
        .catch((error) => {
          console.error('Error sending verification email:', error);
        });
    });
});
