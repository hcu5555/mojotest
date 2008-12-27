/** *	 Copyright 2009 Philipp Laeubli  *	 Licensed under the Apache License, Version 2.0 (the "License");  *	 you may not use this file except in compliance with the License.  *	 You may obtain a copy of the License at  *	  *	 http://www.apache.org/licenses/LICENSE-2.0  *	  *	 Unless required by applicable law or agreed to in writing, software  *	 distributed under the License is distributed on an "AS IS" BASIS,  *	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *	 See the License for the specific language governing permissions and  *	 limitations under the License. */ package ch.badmojo.test {	import ch.badmojo.test.viz.Grid;	import ch.badmojo.test.viz.TestClassViz;	import flash.display.Sprite;	import flash.display.StageAlign;	import flash.display.StageScaleMode;			/**	 * @author phil	 */	public class TestSuite extends Sprite {		private var _tests : Array;		private var _grid : Grid;		public function TestSuite() {			_tests = new Array();			_grid = new Grid(3, stage.stageWidth);			addChild(_grid);			_grid.y = 20;			stage.scaleMode = StageScaleMode.NO_SCALE;			stage.align = StageAlign.TOP_LEFT;		}		public function runAll() : void {			for each (var test : TestCase in _tests) {				test.run();				if(test.getResults().length > 0) {					var tc : TestClassViz = new TestClassViz(test);					_grid.add(tc);				}			}		}		public function registerTestCase(test : TestCase) : void {			_tests.push(test);		}	}}