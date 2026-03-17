namespace GtkAux.Internal.SetDataHelper
{
	private class ItemBox<T>: Object {
		internal T item;
		internal ItemBox(T item){
			this.item = item;
		}
	}

	private class ArrayBox<T>: Object {
		internal T[]? array;
		internal ArrayBox(T[] array){
			this.array = array;
		}
	}

	private class GLibArrayBox<T>: Object {
		internal GLib.GenericArray<T>? array;
		internal GLibArrayBox(GLib.GenericArray<T> array){
			this.array = array;
		}
	}

	internal class SetData: Object {
		protected weak GLib.Object object;
		private string key;
		internal bool flag;
		protected unowned GLib.Object? box {
			get{
				unowned GLib.Object? tmp = this.object.get_data<GLib.Object>(this.key);
				if(tmp==null){return null;}
				return tmp;
			}
			set{
				if(value!=null){this.object.set_data<GLib.Object>(this.key,value);}
				else{message("value is null.");}
			}
		}
		internal bool has_content(){
			unowned GLib.Object? tmp = this.object.get_data<GLib.Object>(this.key);
			return (tmp == null)? false : true;
		}
		protected SetData(GLib.Object object,string key){
			this.object = object;
			this.key = key;
			this.flag = false;
		}
		protected SetData.with_data(GLib.Object object,GLib.Object data,string key){
			this.object = object;
			this.key = key;
			this.box = data;
			this.flag = false;
		}
	}

	internal class SetData_Var<T>: SetData {
		internal SetData_Var(GLib.Object object,string key){
			base(object,key);
		}
		internal SetData_Var.with_data(GLib.Object object, T data, string key){
			base.with_data(object,new ItemBox<T>(data),key);
		}
		internal unowned T? content_ref{
			get{
				unowned ItemBox<T> tmp = (this.box as ItemBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				else{return tmp.item;}
			}
			set{
				unowned ItemBox<T> tmp = (this.box as ItemBox<T>);
				if(tmp == null){
					this.box = new ItemBox<T>(value);
				}
				else{
					tmp.item = value;
				}
			}
		}
		internal owned T? content{
			get{
				ItemBox<T> tmp = (this.box as ItemBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				else{return tmp.item;}
			}
			set{
				this.box = new ItemBox<T>(value);
			}
		}
	}

	internal class SetData_Array<T>: SetData {
		internal PseudoArray<T>? array;
		internal SetData_Array(GLib.Object object,string key){
			base(object,key);
			this.array = new PseudoArray<T>(this);
		}
		internal SetData_Array.with_data(GLib.Object object, T[]? data, string key){
			if(data == null){warning("data is null, expected array.");}
			base.with_data(object,new ArrayBox<T>(data),key);
			this.array = new PseudoArray<T>(this);
		}
		internal unowned T[]? content_ref{
			get{
				unowned ArrayBox<T> tmp = (this.box as ArrayBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				else{return tmp.array;}
			}
			set{
				unowned ArrayBox<T> tmp = (this.box as ArrayBox<T>);
				if (tmp == null){
					warning("data box is empty.");
					this.content = value;
				}
				else{
					tmp.array = value;
				}
			}
		}
		internal owned T[]? content{
			get{
				owned ArrayBox<T> tmp = (this.box as ArrayBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				else{return tmp.array;}
			}
			set{
				this.box = new ArrayBox<T>(value);
			}
		}
		internal int length{
			get{
				var tmp = (this.box as ArrayBox<T>);
				return (tmp == null)? 0
				:
				tmp.array.length;
			}
		}
		internal class PseudoArray<T>: Object{
			private weak SetData_Array<T> mother;
			private void bug_0(){
				if(typeof(T).is_value_type()){message("Known Bug: .array is buggy when using value type. Please use .content and .content_ref instead.");}
			}
			internal PseudoArray(SetData_Array mother){
				this.mother = mother;
			}
			internal new T? get(int index){
				owned ArrayBox<T> tmp = (this.mother.box as ArrayBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				if (index < 0 || index >= tmp.array.length){critical("index is out of length.");return null;}
				this.bug_0();
				return tmp.array[index];
			}
			internal new void set(int index,T? item){
				unowned ArrayBox<T> tmp = (this.mother.box as ArrayBox<T>);
				if(item == null){warning("new data is null.");}
				if (index < 0 || index >= tmp.array.length){critical("index is out of length.");return;}
				this.bug_0();
				tmp.array[index] = item;
			}
			internal int length {
				get{
					return this.mother.length;
				}
			}
		}
	}

	internal class SetData_GObject: SetData {
		internal SetData_GObject(GLib.Object object,string key){
			base(object,key);
		}
		internal SetData_GObject.with_data(GLib.Object object, GLib.Object? data, string key){
			if (data == null){warning("new data is null.");}
			base.with_data(object,data,key);
		}
		internal unowned GLib.Object? content_ref{
			get{
				return this.box;
			}
		}
		internal owned GLib.Object? content{
			get{
				return this.box;
			}
			set{
				if(value == null){warning("value is null.");}
				this.box = value;
			}
		}
	}


	internal class SetData_GLibArray<T>: SetData {
		internal SetData_GLibArray(GLib.Object object,string key){
			base(object,key);
		}
		internal SetData_GLibArray.with_data(GLib.Object object, GLib.GenericArray<T>? data, string key){
			if(data == null){warning("data is null, expected array.");}
			base.with_data(object,new GLibArrayBox<T>(data),key);
		}
		internal unowned GLib.GenericArray<T>? content_ref{
			get{
				unowned GLibArrayBox<T> tmp = (this.box as GLibArrayBox<T>);
				if (tmp == null){warning("data box is empty.");return null;}
				else{return tmp.array;}
			}
			set{
				unowned GLibArrayBox<T> tmp = (this.box as GLibArrayBox<T>);
				if (tmp == null){
					warning("data box is empty.");
					this.content = value;
				}
				else{
					tmp.array = value;
				}
			}
		}
		internal owned GLib.GenericArray<T>? content{
			get{
				owned GLibArrayBox<T> tmp = (this.box as GLibArrayBox<T>);
				if (tmp == null){critical("data box is empty.");return null;}
				else{return tmp.array;}
			}
			set{
				this.box = new GLibArrayBox<T>(value);
			}
		}
	}
}
