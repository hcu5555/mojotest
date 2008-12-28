/** *	 Copyright 2009 Philipp Laeubli  *	 Licensed under the Apache License, Version 2.0 (the "License");  *	 you may not use this file except in compliance with the License.  *	 You may obtain a copy of the License at  *	  *	 http://www.apache.org/licenses/LICENSE-2.0  *	  *	 Unless required by applicable law or agreed to in writing, software  *	 distributed under the License is distributed on an "AS IS" BASIS,  *	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *	 See the License for the specific language governing permissions and  *	 limitations under the License. */package ch.badmojo.test.viz {	import flash.events.MouseEvent;		import ch.badmojo.test.model.Model;		import ch.badmojo.test.model.TestAssertModel;		import ch.badmojo.test.model.ModelListener;		import ch.badmojo.test.model.TestMethodModel;	import flash.display.Sprite;			/**	 * @author phil	 */	public class TestMethodViz  extends Sprite implements ModelListener {		private var _grid : Grid;		private var _tr : TestMethodModel;		private var _size : Number;		public function TestMethodViz(tr : TestMethodModel) {			_tr = tr;			tr.addModelListener(this);			graphics.beginFill(0xff66000, 0.2);			_size = tr.getAsserts().length * 5; 			draw(0.1);			_grid = new Grid(5, _size);			addChild(_grid);			createAsserts(tr);			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);		}		private function mouseOut(event : MouseEvent) : void {			_tr.mouseOut();		}		private function mouseOver(event : MouseEvent) : void {			_tr.mouseOver();		}		private function draw(theAlpha : Number) : void {			graphics.clear();			graphics.beginFill(0xff6600, 0.2);			graphics.lineStyle(1, 0xff6600, theAlpha);			graphics.drawRect(0, 0, _size, _size);			graphics.endFill();		}		private function createAsserts(tr : TestMethodModel) : void {			var asserts : Vector.<TestAssertModel> = tr.getAsserts();			for each (var ta : TestAssertModel in asserts) {				var taviz : TestAssertViz = new TestAssertViz(ta);				_grid.add(taviz);			}		}		public function modelChanged(name : String) : void {			switch(name) {				case Model.MOUSE_OVER:					draw(0.5);					break;				case Model.MOUSE_OUT:					draw(0.1);					break;			}		}	}}