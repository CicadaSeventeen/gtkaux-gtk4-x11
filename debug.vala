namespace GX11LegacyHelper {
	namespace Debug {
		internal void known_bug_0() {
			message("Known Bug: Result may not be right if check immediatly afte set or change. Please sleep for some ms as workaround.");
		}
		internal void warn_hint_not_supported_2(string hint_str,string hint_type_str){
			warning("Hint %s of %s is not supported",hint_str,hint_type_str);
		}
	}
}
