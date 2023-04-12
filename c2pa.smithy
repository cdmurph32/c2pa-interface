// c2pa.smithy
// A simple service that calculates the factorial of a whole number


// Tell the code generator how to reference symbols defined in this namespace
metadata package = [ { namespace: "org.adobe.interface.c2pa", crate: "wasmcloud-interface-c2pa" } ]

namespace org.adobe.interface.c2pa

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#n
use org.wasmcloud.model#codegenRust

/// The C2Pa service has a single method, calculate, which
/// calculates the factorial of its whole number parameter.
@wasmbus(
    contractId: "wasmcloud:adobe:c2pa",
    actorReceive: true,
    providerReceive: true )
service C2Pa {
  version: "0.1",
  operations: [ EmbedTranscodeClaim ]
}

structure CalculateInput {

    @required
    @n(0)
    origin: Blob,

    @required
    @n(1)
    origin_url: String,

    @required
    @n(2)
    origin_filename: String,

    @required
    @n(3)
    origin_mime_type: String,

    @required
    @n(4)
    render: Blob,

    @required
    @n(5)
    output_mime_type: String,

    @required
    @n(6)
    thumb: Blob,

    @required
    @n(7)
    thumb_mime_type: String,
}

/// Calculates the factorial (n!) of the input parameter
operation EmbedTranscodeClaim {
  input: CalculateInput,
  output: Blob,
}
