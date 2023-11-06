require ["fileinto", "mailbox"];

if exists "X-Spam-Flag" {
if header :contains "X-Spam-Flag" "NO" {

} else {
fileinto :create "Spam";
stop;
}

}
