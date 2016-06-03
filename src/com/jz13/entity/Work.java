package com.jz13.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_work")
public class Work {



		private Integer id;
		//private Z_Work work;
		private String title;
		private User user;
		private String content;
		private String img;
		private Date  time;
		
	
		
		
		@Id
		@GeneratedValue(generator="_native")
		@GenericGenerator(name="_native",strategy="native")
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		/*@ManyToOne
		@JoinColumn(name="z_workId")
		public Z_Work getWork() {
			return work;
		}
		public void setWork(Z_Work work) {
			this.work = work;
		}*/
		@Column(length=50)
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		@ManyToOne
		@JoinColumn(name="userId")	
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		
		@Lob
		@Column(columnDefinition="TEXT")
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		
		@Column(length=50)
		public String getImg() {
			return img;
		}
		public void setImg(String img) {
			this.img = img;
		}
		
		public Date getTime() {
			return time;
		}
		public void setTime(Date time) {
			this.time = time;
		}
		
		

	}



