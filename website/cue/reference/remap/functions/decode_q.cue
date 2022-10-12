package metadata

remap: functions: decode_q: {
	category:    "Codec"
	description: """
		Replaces in the `value` q-encoded or base64-encoded [encoded-word](\(urls.encoded_word)) string with their original string.
		"""

	arguments: [
		{
			name:        "value"
			description: "The string with [encoded-words](\(urls.encoded_word)) to decode."
			required:    true
			type: ["string"]
		},
	]
	internal_failure_reasons: [
		"`value` has invalid encoded [encoded-word](\(urls.encoded_word)) string.",
	]
	return: types: ["string"]

	examples: [
		{
			title: "Decode single encoded-word"
			source: """
				decode_q!("=?utf-8?b?SGVsbG8sIFdvcmxkIQ==?=")
				"""
			return: "Hello, World!"
		},
		{
			title: "Embedded"
			source: """
				decode_q!("From: =?utf-8?b?SGVsbG8sIFdvcmxkIQ==?= <=?utf-8?q?hello=5Fworld=40example=2ecom?=>")
				"""
			return: "From: Hello, World! <hello_world@example.com>"
		},
		{
			title: "Without charset"
			source: """
				decode_q!("?b?SGVsbG8sIFdvcmxkIQ==")
				"""
			return: "Hello, World!"
		},
	]
}
