# Certification Notes

## ExplicitlyDisposable

When a class implementd the IDisposable interface, in the finally clause of a try..catch block, the instance must be tested for null before calling Dispose() directly on the instance

## ildasm.exe

Used to merge resource files into an assembly

## lock(x)

When protecting against multiple threads accessing the same block of code, a PRIVATE variable of type Object should be created and the lock statement should be used on that object.

## INotifyDataErrorInfo (WPF)

## yield return

## Interfaces

Methods defined in an interface are public by default and cannot be changed. No need to use the PUBLIC access modifier in the interface.

## Regex

### Character classes

.	any character except newline
\w\d\s	word, digit, whitespace
\W\D\S	not word, digit, whitespace
[abc]	any of a, b, or c
[^abc]	not a, b, or c
[a-g]	character between a & g

### Anchors

^abc$	start / end of the string
\b\B	word, not-word boundary

### Escaped characters

\.\*\\	escaped special characters
\t\n\r	tab, linefeed, carriage return

### Groups & Lookaround

(abc)	capture group
\1	backreference to group #1
(?:abc)	non-capturing group
(?=abc)	positive lookahead
(?!abc)	negative lookahead

### Quantifiers & Alternation

a*a+a?	0 or more, 1 or more, 0 or 1
a{5}a{2,}	exactly five, two or more
a{1,3}	between one & three
a+?a{2,}?	match as few as possible
ab|cd	match ab or cd

# MakeCert

When creating a certificate, the private key is required for "CN=pkey" but without the extension.

## ThreadPools

The ThreadPool class is used to assign operations to a background thread. The QueueUserWorkItem method queues a delegate to run on the next available ThreadPool thread. The delegate describes a method that accepts a single object argument and has no return value. The ThreadPool class uses a hill-climbing algorithm to add or remove backbround threads as needed to maximize overall throughput.

The overload to QueueUserWorkItem that accepts an object as the second argument passes the argument to the delegate when the delegate is executed. When the iterator variable s is passed by value to the QueueUserWorkItem method, a copy of the reference to the current object in the iteration is taken. This ensures that whether the delegate is immediately executed or queued for a long time, the currect state object is processed.

## Public/Private keys

To assure that data sent to another is not tampered with, the data should be encrypted with the sender's private key and decrypted by the sender's public key at the destination. By encrypted by the private key, it cannot be decrypted without the public key which would only be in the posession of the destination.

## TcpListener

The constructor for the TcpListener requires only the IP address and the port.

```
TcpListener listener = new TcpListener(ip, port);
listener.Start();
TcpClient client = listener.AcceptTcpClient();
NetworkStream stream = client.GetStread();
using(StreadReader reader = new StreadmReader(stream)) {
    string message = reader.ReadToEnd();
}
```

## COM

To expose an assembly to COM, three things are needed:

1. `[assembly: ComVisible(true)]`
2. `[assembly: Guid("..")]`
3. `tlbexp <assemblyfilename>.dll`

## BlockingCollection vs ConcurrentQueue

BlockingCollection implements the `Add()` and `Take()` methods. ConcurrentQueue does not.

## Windows Permission

If a Windows program requires a user to be in a particular security group to execute a particular method, the authority can be provided by adding this piece of code before the calling method:

`AppDomain.CurrentDomain.SetPrincipalPolicy(PrincipalPolicy.WindowsPrincipal);`

## Partial class

To defines code in a single class in more than one file, the `partial` annotation must be provided.

## async/await

By marking a method call with `await` the calling code can determine when to continue processing after the async call completes

## XDocument

When operating on an XML file, to update any data, select the entire XML tag not just the value to be updated.

## Serializing to XML

To serialize all members of a class to XML requires using the `DataContractSerilizer` as this will handle the private members of the class. The `XmlSerializer` will only work on the public properties of the class.

## Explicit implementation of an Interface

When implementing interfaces with similar methods, there are two choices:

    1. One method can implement implicitly, but must include an access modifier, and the other must be implemented explicitly without an access modifer
    2. Both metods can be implemented explicitly without an access modifier

## EventLog

To write to the event log requires the following steps:

    1. Check that the event log source exists; if not, create it
    2. Instantiate a new instance of the event log
    3. Set the `source` for the new instance
    4. Call the `WriteEntry()` method

