package chap05.oracle;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PersonDAO implements InterPersonDAO {

	private DataSource ds; // Database ds 이 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
							// 이다
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public PersonDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/jspbegin_oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	// 개인성향을 입력해주는 메서드(insert)
	@Override
	public int personRegister(PersonDTO psdto) throws SQLException {

		int n = 0;
		try {
			conn = ds.getConnection();

			// conn.setAutoCommit(true); _ auto commit 이다.
			// conn.setAutoCommit(false); _ 수동 commit 이다.

			String sql = " insert into tbl_person_interest(seq, name, school, color, food) "
					+ " values(person_seq.nextval, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, psdto.getName());
			pstmt.setString(2, psdto.getSchool());
			pstmt.setString(3, psdto.getColor());
			pstmt.setString(4, psdto.getStrFood());

			n = pstmt.executeUpdate();
		} finally {
			close();
		}
		return n;
	}

	// 자원 반납 메소드
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 정보를 모두 보여주는 메소드
	@Override
	public List<PersonDTO> selectAll() throws SQLException {

		List<PersonDTO> personList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "select seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') as registerday\n"
					+ "from tbl_person_interest\n" + "order by seq";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PersonDTO psdto = new PersonDTO();
				psdto.setSeq(rs.getInt(1));
				psdto.setName(rs.getString(2));
				psdto.setSchool(rs.getString(3));
				psdto.setColor(rs.getString(4));
				psdto.setFood(rs.getString(5).split("\\,"));
				psdto.setRegisterday(rs.getString(6));

				personList.add(psdto);
			}
		} finally {
			close();
		}

		return personList;
	}

	// 특정 행 한개만 보여주는 메소드
	@Override
	public PersonDTO selectOne(String seq) throws SQLException {
		PersonDTO psdto = null;
		try {
			conn = ds.getConnection();
			String sql = "select seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') as registerday\n"
					+ "from tbl_person_interest\n" + "where seq = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				psdto = new PersonDTO();
				psdto.setSeq(rs.getInt(1));
				psdto.setName(rs.getString(2));
				psdto.setSchool(rs.getString(3));
				psdto.setColor(rs.getString(4));
				psdto.setFood(rs.getString(5).split("\\,"));
				psdto.setRegisterday(rs.getString(6));
			}
		} finally {
			close();
		}
		
		return psdto;
	}

	@Override
	public int personUpdate(PersonDTO psdto, int seq) throws SQLException {
		
		int n = 0;
		try{
			conn = ds.getConnection();
			String sql = "update tbl_person_interest \n"+
					"set name = ?,\n"+
					"    school = ?,\n"+
					"    color = ?,\n"+
					"    food = ?\n"+
					"where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, psdto.getName());
			pstmt.setString(2, psdto.getSchool());
			pstmt.setString(3, psdto.getColor());
			pstmt.setString(4, psdto.getStrFood());
			pstmt.setInt(5, seq);
			
			n = pstmt.executeUpdate();
		}finally {
			close();
		}
		return n;
	}
}