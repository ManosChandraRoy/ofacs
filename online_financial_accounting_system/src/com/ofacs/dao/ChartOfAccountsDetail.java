package com.ofacs.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="acc_voucher_detail")
public class ChartOfAccountsDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="vd_sl_no")
	private int serialNo;
	
	@Id
	@ManyToOne
	@JoinColumn(name="vd_vno")
	private ChartOfAccountsMaster vd_vno;
	
	@Id
	@Column(name ="vd_ca_id")
	private String controlHead;
	
	@Id
	@Column(name ="vd_project_code")
	private String project;
	
	@Id
	@Column(name ="vd_deptId")
	private String department;
	
	@Column(name ="vd_debit")
	private double debit;
	
	@Column(name ="vd_credit")
	private double credit;
	
	@Column(name ="vd_chq_no")
	private String chequeNo;
	
	@Column(name ="booking_id")
	private int bookingId;
	
	@Column(name ="vd_bill_no")
	private String billNo;
	
	@Column(name ="vd_inv_no")
	private String invoiceNo;
	
	@Column(name ="vd_mr_no")
	private String mrNo;
	
	@Column(name ="vd_desc")
	private String description;
	
	@Column(name ="vd_bank_id")
	private int bankId;
	
	@Column(name ="bandle_number")
	private String bandleNo;

	
	
	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	public ChartOfAccountsMaster getVoucherNo() {
		return vd_vno;
	}

	public void setVoucherNo(ChartOfAccountsMaster voucherNo) {
		this.vd_vno = voucherNo;
	}


	public String getControlHead() {
		return controlHead;
	}

	public void setControlHead(String controlHead) {
		this.controlHead = controlHead;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public double getDebit() {
		return debit;
	}

	public void setDebit(double debit) {
		this.debit = debit;
	}

	public double getCredit() {
		return credit;
	}

	public void setCredit(double credit) {
		this.credit = credit;
	}

	public String getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public String getMrNo() {
		return mrNo;
	}

	public void setMrNo(String mrNo) {
		this.mrNo = mrNo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getBankId() {
		return bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBandleNo() {
		return bandleNo;
	}

	public void setBandleNo(String bandleNo) {
		this.bandleNo = bandleNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
