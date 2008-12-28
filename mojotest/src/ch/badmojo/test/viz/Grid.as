/** *	 Copyright 2009 Philipp Laeubli  *	 Licensed under the Apache License, Version 2.0 (the "License");  *	 you may not use this file except in compliance with the License.  *	 You may obtain a copy of the License at  *	  *	 http://www.apache.org/licenses/LICENSE-2.0  *	  *	 Unless required by applicable law or agreed to in writing, software  *	 distributed under the License is distributed on an "AS IS" BASIS,  *	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  *	 See the License for the specific language governing permissions and  *	 limitations under the License. */package ch.badmojo.test.viz {	import flash.display.Sprite;		/**	 * @author phil	 */	public class Grid extends Sprite {		private var _currentWidth : Number = 0;		private var _maxWidth : Number = 0;		private var _rowHeight : Number = 0;		private var _currentHeight : Number = 0;		private var _margin : Number;		public function Grid(theWidth : Number ,margin : Number) {			_margin = margin;			_maxWidth = theWidth;		}		public function add(sprite : Sprite) : void {			if (_currentWidth <= _maxWidth) {				_rowHeight = Math.max(_rowHeight, sprite.height);			} else {				_currentWidth = 0;					_currentHeight += _rowHeight + _margin;			}			sprite.x = _currentWidth;			sprite.y = _currentHeight;			addChild(sprite);			_currentWidth += sprite.width + _margin;		}	}}