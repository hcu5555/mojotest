/** *	 Copyright 2009 Philipp Laeubli  *	 Licensed under the Apache License, Version 2.0 (the "License");  *	 you may not use this file except in compliance with the License.  *	 You may obtain a copy of the License at  *	  *	 http://www.apache.org/licenses/LICENSE-2.0  *	  *	 Unless required by applicable law or agreed to in writing, software  *	 distributed under the License is distributed on an "AS IS" BASIS,  *	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *	 See the License for the specific language governing permissions and  *	 limitations under the License. */package ch.badmojo.test.viz {	import flash.display.Sprite;		import ch.badmojo.test.model.TestAssertModel;		import ch.badmojo.test.model.ModelListener;		/**	 * @author phil	 */	public class TestAssertViz extends Sprite implements ModelListener {		public function TestAssertViz(assert : TestAssertModel) {			graphics.beginFill(0xff0000, 0.6);			graphics.drawRect(0, 0, 5, 5);			graphics.endFill();		}		public function modelChanged(name : String) : void {		}	}}