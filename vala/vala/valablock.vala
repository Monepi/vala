/* valablock.vala
 *
 * Copyright (C) 2006  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

namespace Vala {
	public class Block : Statement {
		public readonly ref List<ref Statement> statement_list;
		public readonly ref SourceReference source_reference;
		
		public static ref Block new (List<Statement> statement_list, SourceReference source) {
			return (new Block (statement_list = statement_list, source_reference = source));
		}
		
		public override void accept (CodeVisitor visitor) {
			visitor.visit_begin_block (this);

			foreach (Statement stmt in statement_list) {
				stmt.accept (visitor);
			}

			visitor.visit_end_block (this);
		}
	}
}
