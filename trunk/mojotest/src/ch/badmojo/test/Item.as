/** *		Bachelor of Arts in Design - Interaction Design, 3. Semester *		IAD, Interaction Design, Zurich University of the Arts * 		Copyright (c) 2008 Philipp Laeubli, All Rights Reserved. */package ch.badmojo.test {	import flash.display.DisplayObject;			/**	 * @author phil	 */	public interface Item {		function getHeader() : DisplayObject;		function getContent() : DisplayObject;		function expand() : void;		function contract() : void;		function isExpanded() : Boolean;		function getCurrentHeight() : Number;	}}