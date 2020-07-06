<?php
if(isset($_POST['firstname']))
{


	if($_POST['gender']=='M'){

	$gender="Sir";
	$gend="Male";
}else{

	$gender="Madam";
	$gend="Female";
}
      	//include ("Mail.php"); 
	$email=$_POST['email'];
	$subject = "Wheel- Registration Details";
	$msg  = "User Details,<br/>
		<table>
			<tr>
				<td>First Name </td>
				<td>".$_POST['firstname']."</td>
			</tr>
			<tr>
				<td>Last Name </td>
				<td>".$_POST['lastname']."</td>
			</tr>
			<tr>
				<td>Email </td>
				<td>".$_POST['email']."</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>".$_POST['password']."</td>
			</tr>			
			<tr>
				<td>Gender </td>
				<td>".$gend."</td>
			</tr>
			<tr>
				<td>Date of Birth </td>
				<td>".$_POST['day']."-".$_POST['month']."-".$_POST['year']."</td>
			</tr>
		</table>";



$host = "5.9.192.204"; 
$username = "website@wheelhc.com"; 
$password = "Hello@1981";  

require 'PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer;

$mails = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = $host ;  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = $username;                 // SMTP username
$mail->Password = $password;                           // SMTP password
//$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 25;                                    // TCP port to connect to

$mail->From = 'website@wheelhc.com';
$mail->FromName = 'Wheelhc';
//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
$mail->addAddress('registration@wheelhc.com');               // Name is optional
//$mail->addReplyTo($email, 'Information');
//$mail->addCC('wheelhc1@gmail.com');
//$mail->addBCC('bcc@example.com');

//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = $subject;
$mail->Body    = $msg;
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if($mail->send()) {


	
    $subject = "Wheel- Registration Details";
	$msg  = '<table width="650" height="132"  border="0" cellpadding="0" cellspacing="0">
 
  <tr>
    <td><h1 style="font-size:20px;color:#428bca;"><strong>Dear Sir or Madame</strong></h1></td>
  </tr>
  <br>
  <tr>
    <td height="19">Welcome to Wheel Healthcare, the one stop shop to all your healthcare needs! </td></tr>
	<br>

<tr><td>Your dedicated relationship manager shall be in touch with you within 24 hours. </td></tr>
	<br>
<tr><td>For any immediate queries, please feel free to call us on 1-855-wheelhc.</td></tr>
	<br>

<tr><td height="19"><strong>Kind Regards,</td></tr> 
	<br>

<tr><td><strong>Registration Department</strong>

</td>
  </tr>
  	<br>
</table>';


//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mails->isSMTP();                                      // Set mailer to use SMTP
$mails->Host = $host ;  // Specify main and backup SMTP servers
$mails->SMTPAuth = true;                               // Enable SMTP authentication
$mails->Username = $username;                 // SMTP username
$mails->Password = $password;                           // SMTP password
//$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
$mails->Port = 25;                                    // TCP port to connect to

$mails->From = 'registration@wheelhc.com';
$mails->FromName = 'Wheelhc';
//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
$mails->addAddress($email);               // Name is optional
//$mail->addReplyTo($email, 'Information');
//$mail->addCC('wheelhc1@gmail.com');
//$mail->addBCC('bcc@example.com');

//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mails->isHTML(true);                                  // Set email format to HTML

$mails->Subject = $subject;
$mails->Body    = $msg;
$mails->AltBody = 'This is the body in plain text for non-HTML mail clients';

		if(!$mails->send()) {
            header("Location:index.html?msg=failed");
		}else{

          header("Location:index.html?msg=success");
		}

}


}
?>