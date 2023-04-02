bash
echo "The script PID is $$"
sleep 30 &
child_pid=$!
echo "Child PID is $child_pid"
echo "Child process with PID $child_pid is now in the OS waiting queue."
echo "The child process is waiting for a software interrupt from the 
user."
echo "Enter the SIGINT interrupt to have the child process execute on the
CPU."
trap "echo -e '\nSIGINT signal received!'" SIGINT
wait $child_pid
echo "Enter SIGQUIT interrupt."
trap "echo -e '\nSIGQUIT signal received!'" SIGQUIT
wait $child_pid
echo "Completed executing."
echo "Terminated all processes."
exit 0