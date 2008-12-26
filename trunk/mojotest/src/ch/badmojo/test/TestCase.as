/** *	 Copyright 2009 Philipp Laeubli  *	 Licensed under the Apache License, Version 2.0 (the "License");  *	 you may not use this file except in compliance with the License.  *	 You may obtain a copy of the License at  *	  *	 http://www.apache.org/licenses/LICENSE-2.0  *	  *	 Unless required by applicable law or agreed to in writing, software  *	 distributed under the License is distributed on an "AS IS" BASIS,  *	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *	 See the License for the specific language governing permissions and  *	 limitations under the License. */package ch.badmojo.test {	import flash.utils.describeType;		/**	 * @author phil	 */	public class TestCase {		private var _results : Vector.<TestResult>;		private var _currentResult : TestResult;		public function TestCase() {			_results = new Vector.<TestResult>();		}		public function run() : void {			var type : XML = describeType(this);			var typeName : String = type.@name;			var test : XMLList = type.method.(String(@name).indexOf("test") == 0 && @declaredBy == type.@name && @returnType == "void");			for each (var methodDesc : XML in test) {				var methodName : String = methodDesc.@name;				var result : TestResult = new TestResult(typeName, methodName);				_results.push(result);				_currentResult = result;				try {					this[methodName].call(this);				}catch(error : Error) {					_currentResult.setError(error.message);				}			}		}		public function getResults() : Vector.<TestResult> {			return _results;		}		protected function assertEquals(arg0 : Object, arg1 : Object) : void {			if(arg0 != arg1) {				_currentResult.setFailed(arg0.toString() + " is not equal to " + arg1.toString(), getStack()) ;			}else {				_currentResult.assertSuccess(arg0.toString() + " is equal to " + arg1.toString(), getStack());			}		}		protected function assertTrue(object : Boolean) : void {			if(!object) {				_currentResult.setFailed(object.toString() + " is not true", getStack());			}else {				_currentResult.assertSuccess(object.toString() + "is true", getStack());			}		}		protected function assertFalse(object : Boolean) : void {			if(object) {				_currentResult.setFailed(object.toString() + " is not false", getStack());			}else {				_currentResult.assertSuccess(object.toString() + " is false (as it should)", getStack());			}		}		protected function assertNull(object : Object) : void {			if(object != null) {				_currentResult.setFailed(object.toString() + " is not null", getStack());			}else {				_currentResult.assertSuccess(object.toString() + " is null (as it should)", getStack());			}		}		protected function assertNotNull(object : Object) : void {			if(object) {				_currentResult.setFailed(object.toString() + " is null", getStack());			}else {				_currentResult.assertSuccess(object.toString() + " is not null", getStack());			}		}		private function getStack() : String {			try {				throw new Error("");			}catch(error : Error) {				var stack : String = error.getStackTrace();				stack = removeLine(stack,3);				return stack;			}			return null;		}		private function removeLine(string : String,num : Number = 1) : String {			for (var i : Number = 0;i < num; i++) {				string = string.substr(string.indexOf("\n") + 2, string.length);			}			return string;		}	}}