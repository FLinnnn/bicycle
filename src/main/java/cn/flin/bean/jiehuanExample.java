package cn.flin.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class jiehuanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public jiehuanExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andJiehuanidIsNull() {
            addCriterion("jiehuanid is null");
            return (Criteria) this;
        }

        public Criteria andJiehuanidIsNotNull() {
            addCriterion("jiehuanid is not null");
            return (Criteria) this;
        }

        public Criteria andJiehuanidEqualTo(Integer value) {
            addCriterion("jiehuanid =", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidNotEqualTo(Integer value) {
            addCriterion("jiehuanid <>", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidGreaterThan(Integer value) {
            addCriterion("jiehuanid >", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidGreaterThanOrEqualTo(Integer value) {
            addCriterion("jiehuanid >=", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidLessThan(Integer value) {
            addCriterion("jiehuanid <", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidLessThanOrEqualTo(Integer value) {
            addCriterion("jiehuanid <=", value, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidIn(List<Integer> values) {
            addCriterion("jiehuanid in", values, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidNotIn(List<Integer> values) {
            addCriterion("jiehuanid not in", values, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidBetween(Integer value1, Integer value2) {
            addCriterion("jiehuanid between", value1, value2, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andJiehuanidNotBetween(Integer value1, Integer value2) {
            addCriterion("jiehuanid not between", value1, value2, "jiehuanid");
            return (Criteria) this;
        }

        public Criteria andBidIsNull() {
            addCriterion("bid is null");
            return (Criteria) this;
        }

        public Criteria andBidIsNotNull() {
            addCriterion("bid is not null");
            return (Criteria) this;
        }

        public Criteria andBidEqualTo(Integer value) {
            addCriterion("bid =", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidNotEqualTo(Integer value) {
            addCriterion("bid <>", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidGreaterThan(Integer value) {
            addCriterion("bid >", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bid >=", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidLessThan(Integer value) {
            addCriterion("bid <", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidLessThanOrEqualTo(Integer value) {
            addCriterion("bid <=", value, "bid");
            return (Criteria) this;
        }

        public Criteria andBidIn(List<Integer> values) {
            addCriterion("bid in", values, "bid");
            return (Criteria) this;
        }

        public Criteria andBidNotIn(List<Integer> values) {
            addCriterion("bid not in", values, "bid");
            return (Criteria) this;
        }

        public Criteria andBidBetween(Integer value1, Integer value2) {
            addCriterion("bid between", value1, value2, "bid");
            return (Criteria) this;
        }

        public Criteria andBidNotBetween(Integer value1, Integer value2) {
            addCriterion("bid not between", value1, value2, "bid");
            return (Criteria) this;
        }

        public Criteria andBzldidIsNull() {
            addCriterion("bzldid is null");
            return (Criteria) this;
        }

        public Criteria andBzldidIsNotNull() {
            addCriterion("bzldid is not null");
            return (Criteria) this;
        }

        public Criteria andBzldidEqualTo(Integer value) {
            addCriterion("bzldid =", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidNotEqualTo(Integer value) {
            addCriterion("bzldid <>", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidGreaterThan(Integer value) {
            addCriterion("bzldid >", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bzldid >=", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidLessThan(Integer value) {
            addCriterion("bzldid <", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidLessThanOrEqualTo(Integer value) {
            addCriterion("bzldid <=", value, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidIn(List<Integer> values) {
            addCriterion("bzldid in", values, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidNotIn(List<Integer> values) {
            addCriterion("bzldid not in", values, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidBetween(Integer value1, Integer value2) {
            addCriterion("bzldid between", value1, value2, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBzldidNotBetween(Integer value1, Integer value2) {
            addCriterion("bzldid not between", value1, value2, "bzldid");
            return (Criteria) this;
        }

        public Criteria andBdateIsNull() {
            addCriterion("bdate is null");
            return (Criteria) this;
        }

        public Criteria andBdateIsNotNull() {
            addCriterion("bdate is not null");
            return (Criteria) this;
        }

        public Criteria andBdateEqualTo(Date value) {
            addCriterionForJDBCDate("bdate =", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("bdate <>", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateGreaterThan(Date value) {
            addCriterionForJDBCDate("bdate >", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("bdate >=", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateLessThan(Date value) {
            addCriterionForJDBCDate("bdate <", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("bdate <=", value, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateIn(List<Date> values) {
            addCriterionForJDBCDate("bdate in", values, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("bdate not in", values, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("bdate between", value1, value2, "bdate");
            return (Criteria) this;
        }

        public Criteria andBdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("bdate not between", value1, value2, "bdate");
            return (Criteria) this;
        }

        public Criteria andTodateIsNull() {
            addCriterion("todate is null");
            return (Criteria) this;
        }

        public Criteria andTodateIsNotNull() {
            addCriterion("todate is not null");
            return (Criteria) this;
        }

        public Criteria andTodateEqualTo(Date value) {
            addCriterionForJDBCDate("todate =", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateNotEqualTo(Date value) {
            addCriterionForJDBCDate("todate <>", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateGreaterThan(Date value) {
            addCriterionForJDBCDate("todate >", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("todate >=", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateLessThan(Date value) {
            addCriterionForJDBCDate("todate <", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("todate <=", value, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateIn(List<Date> values) {
            addCriterionForJDBCDate("todate in", values, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateNotIn(List<Date> values) {
            addCriterionForJDBCDate("todate not in", values, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("todate between", value1, value2, "todate");
            return (Criteria) this;
        }

        public Criteria andTodateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("todate not between", value1, value2, "todate");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusIsNull() {
            addCriterion("jiehuanstatus is null");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusIsNotNull() {
            addCriterion("jiehuanstatus is not null");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusEqualTo(String value) {
            addCriterion("jiehuanstatus =", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusNotEqualTo(String value) {
            addCriterion("jiehuanstatus <>", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusGreaterThan(String value) {
            addCriterion("jiehuanstatus >", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusGreaterThanOrEqualTo(String value) {
            addCriterion("jiehuanstatus >=", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusLessThan(String value) {
            addCriterion("jiehuanstatus <", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusLessThanOrEqualTo(String value) {
            addCriterion("jiehuanstatus <=", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusLike(String value) {
            addCriterion("jiehuanstatus like", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusNotLike(String value) {
            addCriterion("jiehuanstatus not like", value, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusIn(List<String> values) {
            addCriterion("jiehuanstatus in", values, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusNotIn(List<String> values) {
            addCriterion("jiehuanstatus not in", values, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusBetween(String value1, String value2) {
            addCriterion("jiehuanstatus between", value1, value2, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andJiehuanstatusNotBetween(String value1, String value2) {
            addCriterion("jiehuanstatus not between", value1, value2, "jiehuanstatus");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}